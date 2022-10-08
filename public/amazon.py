#!/usr/bin/python
#-*-conding-*-
#创建文件，并写入数据：要求不能与现存系统文件重名

# import os
# import sys

# def makefile(path,content):
#     if os.path.exists(path):
#         if os.path.isdir(path):
#             f = open('publchello.txt','w+')
#             f.write(content)
#             f.seek(0)
#             read = f.readline()
#             f.close()
#             print(read)
#         else:
#             print('please input the dir name')
#     else:
#         print('the path is not exists')


# path = "C:"
# content = sys.argv[1]
# makefile(path,content)
# 获取ASIN在关键词下的位置       
import os
import sys
import pandas as pd
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.common.keys import Keys
import time as  t
import logging


cookie_us = {
    'value':'session-id=138-5798954-7606920; session-id-time=2082787201l; i18n-prefs=USD; skin=noskin; ubid-main=134-1735890-5750542; session-token=WXFawhKNSmEjyCQIC9z/tzV2cZyYUcfTh66qmycC7wDsBm6cY3rI3xb0whuSv0fqd3j8gUmtPQo1EXlsvRyNH1DjyxvfCFNxhxOUmXstsxHUkJBz9e+QMy1ue2gOFKdVvSUgk6eiB0y8DuUiQFXglKai7ll2l/jzRIvvaMt5I3CMiSTL3mRqgOttLocB9flsKHR4z1YNjBVYpmxsB93mLl8mk/BBr7Lo; lc-main=en_US; csm-hit=tb:M6V8BY9R4N5RTBAE18S2+s-C1SCYZJHXWYKD22SWEC0|1659537101751&t:1659537101751&adb:adblk_no',
    'name':'amazon'
}


class logFrame:
 
    def getlogger(self):
        self.logger = logging.getLogger("logger")
        # 判断是否有处理器，避免重复执行
        if not self.logger.handlers:
            # 日志输出的默认级别为warning及以上级别，设置输出info级别
            self.logger.setLevel(logging.WARNING)
            # 创建一个处理器handler  StreamHandler()控制台实现日志输出
            sh = logging.StreamHandler()
            # 创建一个格式器formatter  （日志内容：当前时间，文件，日志级别，日志描述信息）
            formatter = logging.Formatter(fmt="[%(asctime)s][%(filename)s][%(lineno)d][%(levelname)s]"
                                              "[%(message)s]",datefmt="%Y/%m/%d %H:%M:%S")
 
            # 创建一个文件处理器，文件写入日志
            fh = logging.FileHandler(filename="./{}_log.txt".format(t.strftime("%Y_%m_%d %H_%M_%S",t.localtime())),
                                     encoding="utf8")
            # 创建一个文件格式器f_formatter
            f_formatter = logging.Formatter(fmt="[%(asctime)s][%(filename)s][%(lineno)d][%(levelname)s]"
                                                "[%(message)s]",datefmt="%Y/%m/%d %H:%M:%S")
 
            # 关联控制台日志器—处理器—格式器
            self.logger.addHandler(sh)
            sh.setFormatter(formatter)
            # 设置处理器输出级别
            sh.setLevel(logging.WARNING)
 
            # 关联文件日志器-处理器-格式器
            self.logger.addHandler(fh)
            fh.setFormatter(f_formatter)
            # 设置处理器输出级别
            fh.setLevel(logging.DEBUG)
 
        return self.logger


# 保存到表格，第二个参数是表格里面sheet页签名称
def write_to_one_csv(filepath, datelist, file_header):
    print("正在保存 %s " % (filepath))
    result = pd.DataFrame(columns=file_header)
    
    # print("os.path.exists(filepath) : ", os.path.exists(filepath))
    if os.path.exists(filepath):
        original_data = pd.read_csv(filepath)
        result = result.append(original_data, ignore_index=True)
    
    # column_num = len(file_header)
    for list in datelist:
        result = result.append(pd.DataFrame({file_header[0]:[str(list[0])],file_header[1]:[str(list[1])],file_header[2]:[str(list[2])] \
                                            #,file_header[3]:[str(list[3])],file_header[4]:[str(list[4])] \
                                            }),ignore_index=True)    
    
    # 覆盖式写入
    result.to_csv(filepath,index=0)
        
    return 

def checkNameValid(name=None):
    """
    检测Windows文件名称！
    """
    if name is None:
        print("name is None!")
        return
    reg = re.compile(r'[\\/:*?"<>|\r\n]+')
    valid_name = reg.findall(name)
    if valid_name:
        for nv in valid_name:
            name = name.replace(nv, "_")
    return name.strip().strip('.')

def getOnePageAsinList(driver, asin_data_list, page, dest_asin, location):
    num = 0

    asin_datas = driver.find_elements(By.XPATH, "//div[@data-component-type='s-search-result']")
    # asin_datas = driver.find_elements(By.XPATH, '//div[contains(@class,"sg-col-4-of-12 s-result-item s-asin sg-col-4-of-16 sg-col s-widget-spacing-small sg-col-4-of-20")]')
    # if len(asin_datas) == 0:
    #     asin_datas = driver.find_elements(By.XPATH, '//div[contains(@class,"s-result-item s-asin sg-col-0-of-12 sg-col-16-of-20 AdHolder sg-col s-widget-spacing-small sg-col-12-of-16")]')
    # asin_datas = driver.find_elements(By.CLASS_NAME, 's-main-slot')
    # 在for循环中，最好别使用 goods.find_element_by_xpath()，因为这个方法每次都是基于HTML根起点开始查找的，所以每次循环出来的结果都是一样的。
    # 帮助文档 https://python-selenium-zh.readthedocs.io/zh_CN/latest/4.%E5%85%83%E7%B4%A0%E5%AE%9A%E4%BD%8D/
    
    for one_asin_data in asin_datas:
        num = num + 1
        # 查看元素对应的源码
        # print(one_asin_data.get_attribute("outerHTML"))
        # print(type(asin_data))
        
        try:
            asin = one_asin_data.get_attribute('data-asin')
        except:
            # logger.error('捕获到异常',e)
            asin = "FindNoASIN"
            logger.error("No."+str(num)+" asin Error :" + asin)
            
        try:
            asin_index = one_asin_data.get_attribute('data-index')
            asin_location = str(page)+"-"+asin_index
        except Exception as e:
            # logger.error('捕获到异常',e)
            asin_location = str(page)+"--"
            logger.error("No."+str(num)+" Index Error :" + asin_location)
        
        try:
            asin_href = one_asin_data.find_elements(By.CLASS_NAME, 'a-link-normal')[0].get_property('href')
        except Exception as e:
            # logger.error('捕获到异常',e)
            asin_href = "FindNoLink"
            logger.error("No."+str(num)+" Link Error :" + asin_href)
        
        # try:
        #     asin_price = one_asin_data.find_element(By.CLASS_NAME, 'a-offscreen').text
        # except Exception as e:
        #     # logger.error('捕获到异常',e)
        #     asin_price = "0.00"
        #     logger.error("No."+str(num)+" Price Error :" + asin_price)
        
        # try:
        #     asin_rate = one_asin_data.find_element(By.CLASS_NAME, 'a-icon-alt').text
        # except Exception as e:
        #     # logger.error('捕获到异常',e)
        #     asin_rate = "0.00"
        #     logger.error("No."+str(num)+" Rate Error :" + asin_rate)
            
            
        asin_data_list.append([asin, asin_location, asin_href]) #, asin_price,asin_rate])
        if dest_asin == asin:
            logger.warning("The location of [ " + asin + " ] is [ " + asin_location + " ].")
            print("The location of [ " + asin + " ] is [ " + asin_location + " ].")
        
    return num

def GetKeywordSearchPageInfoCA(keyword, dest_asin, location):
    asin_data_list = []
    
    # 2.配置selenium 注意binary_location and executable_path
    opt = Options()
    opt.binary_location = "C:/Program Files/Google/Chrome/Application/chrome.exe"
    opt.add_argument('--disable-blink-features=AutomationControlled')
    opt.add_argument('--disable-gpu')
    opt.add_argument('user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36"')
    opt.add_argument('Referer="https://www.amazon.com/"')
    # opt.add_argument("--start-maximized")
    opt.add_argument("--no-sandbox")
    opt.add_argument("--disable-dev-shm-usage")

    driver = webdriver.Chrome(options=opt, executable_path="C:/Program Files/Python310/chromedriver.exe")    
    
    # 3.打开amazon首页
    driver.get('https://www.amazon.ca/')
    
    t.sleep(3)
    wait = WebDriverWait(driver, 1)
    address_button = wait.until(EC.presence_of_element_located((By.ID, 'glow-ingress-line2')))
    address_button.click()
    t.sleep(1)
    address_input_zip = wait.until(EC.presence_of_element_located((By.ID, 'GLUXZipUpdateInput_0')))
    address_input_zip.send_keys('V3M')
    address_input_zip = wait.until(EC.presence_of_element_located((By.ID, 'GLUXZipUpdateInput_1')))
    address_input_zip.send_keys('5Y9')
    
    t.sleep(1)            
            
    driver.find_element(By.XPATH, "//div[@class='a-column a-span4 a-span-last']").click()
    t.sleep(1)
    driver.refresh()
    wait = WebDriverWait(driver, 1)
    input = wait.until(EC.presence_of_element_located((By.ID, 'twotabsearchtextbox')))
    
    input.send_keys(keyword)
    driver.find_element(By.XPATH, "//input[@id='nav-search-submit-button']").click()
    
    page = 1
    total = 0
    pageNum = 3
    for page in range(1,pageNum + 1):
        logger.info("page is " + str(page))
        t.sleep(3)
        num = getOnePageAsinList(driver, asin_data_list, page, dest_asin, location)
        logger.info("page [" + str(page)+"] has " + str(num) + " asins")
        total += num
        t.sleep(3)
        driver.find_element(By.CLASS_NAME, 's-pagination-next').click()        
    
    logger.info("Total Page is : " + pageNum + ", Total Listings is : " + tatal)
    driver.quit()
    return asin_data_list

def GetKeywordSearchPageInfoUS(keyword, dest_asin, location):
    asin_data_list = []
    
    # 2.配置selenium
    # service_chrome = Service(r'C:\\notebook\\chromedriver_win32\\chromedriver.exe')
    # opt = Options()
    opt = webdriver.ChromeOptions()
    opt.binary_location = "C:/Program Files/Google/Chrome/Application/chrome.exe"
    
    opt.add_argument('--disable-blink-features=AutomationControlled')
    opt.add_argument('--disable-gpu')
    opt.add_argument('user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36"')
    opt.add_argument('Referer="https://www.amazon.com/"')
    
    driver = webdriver.Chrome("C:/Program Files/Python310/chromedriver.exe", options  = opt)
    
    
    # 3.打开amazon首页
    driver.get('https://www.amazon.com/')
    
    t.sleep(3)
    wait = WebDriverWait(driver, 1)
    address_button = wait.until(EC.presence_of_element_located((By.ID, 'glow-ingress-line2')))
    address_button.click()
    t.sleep(1)
    address_input_zip = wait.until(EC.presence_of_element_located((By.ID, 'GLUXZipUpdateInput')))
    address_input_zip.send_keys('90001')
    t.sleep(1)            
            
    driver.find_element(By.XPATH, "//div[@class='a-column a-span4 a-span-last']").click()
    t.sleep(1)
    driver.refresh()
    wait = WebDriverWait(driver, 1)
    input = wait.until(EC.presence_of_element_located((By.ID, 'twotabsearchtextbox')))
    
    input.send_keys(keyword)
    driver.find_element(By.XPATH, "//input[@id='nav-search-submit-button']").click()
    
    page = 1
    for page in range(1,8):
        logger.info("page is " + str(page))
        t.sleep(3)
        num = getOnePageAsinList(driver, asin_data_list, page, dest_asin, location)
        logger.info("page [" + str(page)+"] has " + str(num) + " asins")
        t.sleep(3)
        driver.find_element(By.CLASS_NAME, 's-pagination-next').click()        
    
    driver.quit()
    return asin_data_list
    

log = logFrame()
logger = log.getlogger()

if __name__ == '__main__':
    # 1.获取要爬取的ASIN和对应关键词
    # asin = 'B07YQLF9XW' # input(r'请输入ASIN：')
    # keyword = 'dyson hairdryer holder' # input(r'请输入关键词：') 
     
    # country = input(r"请输入站点(US/CA): ")
    # keyword = input(r'请输入关键词：')
    # dest_asin = input(r'请输入ASIN：') #"B0B5SFYS5Q" # 
    
    country, keyword, dest_asin = sys.argv[1:4]
    try:
        logger.info("\n[" + country + "][" + dest_asin + "][" + keyword + "]")
        location = "未找到"
        asin_data_list = []

        match country:
            case "US":
                asin_data_list = GetKeywordSearchPageInfoUS(keyword, dest_asin, location)
            case "CA":
                asin_data_list = GetKeywordSearchPageInfoCA(keyword, dest_asin, location)
            case _:
                logger.info("Country not found")

        if len(asin_data_list) == 0:
            logger.error("Country is not in the list.")
            
        logger.warning("[" + country + "][" + dest_asin + "][" + keyword + "][" + location + "]")

        filename = './amazon_csv/' + country + '_' + keyword +'.csv'

        file_header = ['ASIN', 'ASIN页面序号', '链接']#, '价格','星级']

        write_to_one_csv(filename, asin_data_list, file_header)

        df = pd.read_csv(filename)

        logger.info(df)
    except Exception as e:
        # logger.error(e)
        # # info = sys.exc_info()
        # # print(info[0] + " : " + info[1])

