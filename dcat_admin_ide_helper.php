<?php

/**
 * A helper file for Dcat Admin, to provide autocomplete information to your IDE
 *
 * This file should not be included in your code, only analyzed by your IDE!
 *
 * @author jqh <841324345@qq.com>
 */
namespace Dcat\Admin {
    use Illuminate\Support\Collection;

    /**
     * @property Grid\Column|Collection image
     * @property Grid\Column|Collection date
     * @property Grid\Column|Collection id
     * @property Grid\Column|Collection name
     * @property Grid\Column|Collection norms
     * @property Grid\Column|Collection category
     * @property Grid\Column|Collection price
     * @property Grid\Column|Collection shop_name
     * @property Grid\Column|Collection brand
     * @property Grid\Column|Collection state
     * @property Grid\Column|Collection added_at
     * @property Grid\Column|Collection images
     * @property Grid\Column|Collection year
     * @property Grid\Column|Collection rating
     * @property Grid\Column|Collection directors
     * @property Grid\Column|Collection casts
     * @property Grid\Column|Collection genres
     * @property Grid\Column|Collection type
     * @property Grid\Column|Collection version
     * @property Grid\Column|Collection detail
     * @property Grid\Column|Collection created_at
     * @property Grid\Column|Collection updated_at
     * @property Grid\Column|Collection is_enabled
     * @property Grid\Column|Collection parent_id
     * @property Grid\Column|Collection order
     * @property Grid\Column|Collection icon
     * @property Grid\Column|Collection uri
     * @property Grid\Column|Collection extension
     * @property Grid\Column|Collection user_id
     * @property Grid\Column|Collection path
     * @property Grid\Column|Collection method
     * @property Grid\Column|Collection ip
     * @property Grid\Column|Collection input
     * @property Grid\Column|Collection permission_id
     * @property Grid\Column|Collection menu_id
     * @property Grid\Column|Collection slug
     * @property Grid\Column|Collection http_method
     * @property Grid\Column|Collection http_path
     * @property Grid\Column|Collection role_id
     * @property Grid\Column|Collection value
     * @property Grid\Column|Collection username
     * @property Grid\Column|Collection password
     * @property Grid\Column|Collection avatar
     * @property Grid\Column|Collection remember_token
     * @property Grid\Column|Collection country
     * @property Grid\Column|Collection currency
     * @property Grid\Column|Collection COUNTRY
     * @property Grid\Column|Collection COMPANY_NAME
     * @property Grid\Column|Collection FC
     * @property Grid\Column|Collection POSTAL_CODE
     * @property Grid\Column|Collection STATES
     * @property Grid\Column|Collection CITY
     * @property Grid\Column|Collection ADDRESS
     * @property Grid\Column|Collection TYPE
     * @property Grid\Column|Collection POD
     * @property Grid\Column|Collection note
     * @property Grid\Column|Collection listing_id
     * @property Grid\Column|Collection irobot_shipment_id
     * @property Grid\Column|Collection fbaid
     * @property Grid\Column|Collection fba_reference_id
     * @property Grid\Column|Collection from_address
     * @property Grid\Column|Collection to_country
     * @property Grid\Column|Collection fba_code
     * @property Grid\Column|Collection address
     * @property Grid\Column|Collection postcode
     * @property Grid\Column|Collection date_create_ship
     * @property Grid\Column|Collection hope_arrive_date
     * @property Grid\Column|Collection actural_arrive_date
     * @property Grid\Column|Collection carrier_name
     * @property Grid\Column|Collection tracking_num
     * @property Grid\Column|Collection send_method
     * @property Grid\Column|Collection status
     * @property Grid\Column|Collection carrier_file
     * @property Grid\Column|Collection carrier_pdf
     * @property Grid\Column|Collection send_number
     * @property Grid\Column|Collection irobot_id
     * @property Grid\Column|Collection units_number
     * @property Grid\Column|Collection unit_price
     * @property Grid\Column|Collection already_send
     * @property Grid\Column|Collection 备注
     * @property Grid\Column|Collection admin_id
     * @property Grid\Column|Collection media_group_id
     * @property Grid\Column|Collection disk
     * @property Grid\Column|Collection size
     * @property Grid\Column|Collection file_ext
     * @property Grid\Column|Collection file_name
     * @property Grid\Column|Collection meta
     * @property Grid\Column|Collection email
     * @property Grid\Column|Collection token
     * @property Grid\Column|Collection name_chinese
     * @property Grid\Column|Collection name_english
     * @property Grid\Column|Collection asin
     * @property Grid\Column|Collection upc
     * @property Grid\Column|Collection irobot_sku
     * @property Grid\Column|Collection addbyuser
     * @property Grid\Column|Collection unit_size
     * @property Grid\Column|Collection unit_weight
     * @property Grid\Column|Collection box_size
     * @property Grid\Column|Collection box_weight
     * @property Grid\Column|Collection numberperbox
     * @property Grid\Column|Collection amz_listing
     * @property Grid\Column|Collection purchasemethod
     * @property Grid\Column|Collection image_column
     * @property Grid\Column|Collection purchase_cost
     * @property Grid\Column|Collection promotion_product_id
     * @property Grid\Column|Collection promotion_type
     * @property Grid\Column|Collection refund_method
     * @property Grid\Column|Collection order_number
     * @property Grid\Column|Collection order_price
     * @property Grid\Column|Collection order_screenshot
     * @property Grid\Column|Collection review_screenshot
     * @property Grid\Column|Collection review_link
     * @property Grid\Column|Collection review_submit_date
     * @property Grid\Column|Collection review_show_date
     * @property Grid\Column|Collection review_type
     * @property Grid\Column|Collection refund_status
     * @property Grid\Column|Collection refund_date
     * @property Grid\Column|Collection refund_money
     * @property Grid\Column|Collection keyword_location
     * @property Grid\Column|Collection agent_contact
     * @property Grid\Column|Collection store_name
     * @property Grid\Column|Collection person
     * @property Grid\Column|Collection picture
     * @property Grid\Column|Collection name_local
     * @property Grid\Column|Collection sku
     * @property Grid\Column|Collection taday_order_number
     * @property Grid\Column|Collection taday_order_ammount
     * @property Grid\Column|Collection today_average_price
     * @property Grid\Column|Collection yesterday_order_number
     * @property Grid\Column|Collection yesterday_order_ammount
     * @property Grid\Column|Collection yesterday_order_price
     * @property Grid\Column|Collection lastweekday_order_number
     * @property Grid\Column|Collection lastweekday_order_ammount
     * @property Grid\Column|Collection lastweekday_order_price
     * @property Grid\Column|Collection inventory_salable
     * @property Grid\Column|Collection inventory_receivable
     * @property Grid\Column|Collection inventory_movable
     * @property Grid\Column|Collection amz_account
     * @property Grid\Column|Collection amz_sku
     * @property Grid\Column|Collection fnsku
     * @property Grid\Column|Collection local_name
     * @property Grid\Column|Collection saler
     * @property Grid\Column|Collection fba_fee
     * @property Grid\Column|Collection amz_sale_commssion
     * @property Grid\Column|Collection fba_current_inventory
     * @property Grid\Column|Collection fba_current_transfer
     * @property Grid\Column|Collection latest_transportation_unitfee
     * @property Grid\Column|Collection rew_number
     * @property Grid\Column|Collection rew_rate
     * @property Grid\Column|Collection email_verified_at
     *
     * @method Grid\Column|Collection image(string $label = null)
     * @method Grid\Column|Collection date(string $label = null)
     * @method Grid\Column|Collection id(string $label = null)
     * @method Grid\Column|Collection name(string $label = null)
     * @method Grid\Column|Collection norms(string $label = null)
     * @method Grid\Column|Collection category(string $label = null)
     * @method Grid\Column|Collection price(string $label = null)
     * @method Grid\Column|Collection shop_name(string $label = null)
     * @method Grid\Column|Collection brand(string $label = null)
     * @method Grid\Column|Collection state(string $label = null)
     * @method Grid\Column|Collection added_at(string $label = null)
     * @method Grid\Column|Collection images(string $label = null)
     * @method Grid\Column|Collection year(string $label = null)
     * @method Grid\Column|Collection rating(string $label = null)
     * @method Grid\Column|Collection directors(string $label = null)
     * @method Grid\Column|Collection casts(string $label = null)
     * @method Grid\Column|Collection genres(string $label = null)
     * @method Grid\Column|Collection type(string $label = null)
     * @method Grid\Column|Collection version(string $label = null)
     * @method Grid\Column|Collection detail(string $label = null)
     * @method Grid\Column|Collection created_at(string $label = null)
     * @method Grid\Column|Collection updated_at(string $label = null)
     * @method Grid\Column|Collection is_enabled(string $label = null)
     * @method Grid\Column|Collection parent_id(string $label = null)
     * @method Grid\Column|Collection order(string $label = null)
     * @method Grid\Column|Collection icon(string $label = null)
     * @method Grid\Column|Collection uri(string $label = null)
     * @method Grid\Column|Collection extension(string $label = null)
     * @method Grid\Column|Collection user_id(string $label = null)
     * @method Grid\Column|Collection path(string $label = null)
     * @method Grid\Column|Collection method(string $label = null)
     * @method Grid\Column|Collection ip(string $label = null)
     * @method Grid\Column|Collection input(string $label = null)
     * @method Grid\Column|Collection permission_id(string $label = null)
     * @method Grid\Column|Collection menu_id(string $label = null)
     * @method Grid\Column|Collection slug(string $label = null)
     * @method Grid\Column|Collection http_method(string $label = null)
     * @method Grid\Column|Collection http_path(string $label = null)
     * @method Grid\Column|Collection role_id(string $label = null)
     * @method Grid\Column|Collection value(string $label = null)
     * @method Grid\Column|Collection username(string $label = null)
     * @method Grid\Column|Collection password(string $label = null)
     * @method Grid\Column|Collection avatar(string $label = null)
     * @method Grid\Column|Collection remember_token(string $label = null)
     * @method Grid\Column|Collection country(string $label = null)
     * @method Grid\Column|Collection currency(string $label = null)
     * @method Grid\Column|Collection COUNTRY(string $label = null)
     * @method Grid\Column|Collection COMPANY_NAME(string $label = null)
     * @method Grid\Column|Collection FC(string $label = null)
     * @method Grid\Column|Collection POSTAL_CODE(string $label = null)
     * @method Grid\Column|Collection STATES(string $label = null)
     * @method Grid\Column|Collection CITY(string $label = null)
     * @method Grid\Column|Collection ADDRESS(string $label = null)
     * @method Grid\Column|Collection TYPE(string $label = null)
     * @method Grid\Column|Collection POD(string $label = null)
     * @method Grid\Column|Collection note(string $label = null)
     * @method Grid\Column|Collection listing_id(string $label = null)
     * @method Grid\Column|Collection irobot_shipment_id(string $label = null)
     * @method Grid\Column|Collection fbaid(string $label = null)
     * @method Grid\Column|Collection fba_reference_id(string $label = null)
     * @method Grid\Column|Collection from_address(string $label = null)
     * @method Grid\Column|Collection to_country(string $label = null)
     * @method Grid\Column|Collection fba_code(string $label = null)
     * @method Grid\Column|Collection address(string $label = null)
     * @method Grid\Column|Collection postcode(string $label = null)
     * @method Grid\Column|Collection date_create_ship(string $label = null)
     * @method Grid\Column|Collection hope_arrive_date(string $label = null)
     * @method Grid\Column|Collection actural_arrive_date(string $label = null)
     * @method Grid\Column|Collection carrier_name(string $label = null)
     * @method Grid\Column|Collection tracking_num(string $label = null)
     * @method Grid\Column|Collection send_method(string $label = null)
     * @method Grid\Column|Collection status(string $label = null)
     * @method Grid\Column|Collection carrier_file(string $label = null)
     * @method Grid\Column|Collection carrier_pdf(string $label = null)
     * @method Grid\Column|Collection send_number(string $label = null)
     * @method Grid\Column|Collection irobot_id(string $label = null)
     * @method Grid\Column|Collection units_number(string $label = null)
     * @method Grid\Column|Collection unit_price(string $label = null)
     * @method Grid\Column|Collection already_send(string $label = null)
     * @method Grid\Column|Collection 备注(string $label = null)
     * @method Grid\Column|Collection admin_id(string $label = null)
     * @method Grid\Column|Collection media_group_id(string $label = null)
     * @method Grid\Column|Collection disk(string $label = null)
     * @method Grid\Column|Collection size(string $label = null)
     * @method Grid\Column|Collection file_ext(string $label = null)
     * @method Grid\Column|Collection file_name(string $label = null)
     * @method Grid\Column|Collection meta(string $label = null)
     * @method Grid\Column|Collection email(string $label = null)
     * @method Grid\Column|Collection token(string $label = null)
     * @method Grid\Column|Collection name_chinese(string $label = null)
     * @method Grid\Column|Collection name_english(string $label = null)
     * @method Grid\Column|Collection asin(string $label = null)
     * @method Grid\Column|Collection upc(string $label = null)
     * @method Grid\Column|Collection irobot_sku(string $label = null)
     * @method Grid\Column|Collection addbyuser(string $label = null)
     * @method Grid\Column|Collection unit_size(string $label = null)
     * @method Grid\Column|Collection unit_weight(string $label = null)
     * @method Grid\Column|Collection box_size(string $label = null)
     * @method Grid\Column|Collection box_weight(string $label = null)
     * @method Grid\Column|Collection numberperbox(string $label = null)
     * @method Grid\Column|Collection amz_listing(string $label = null)
     * @method Grid\Column|Collection purchasemethod(string $label = null)
     * @method Grid\Column|Collection image_column(string $label = null)
     * @method Grid\Column|Collection purchase_cost(string $label = null)
     * @method Grid\Column|Collection promotion_product_id(string $label = null)
     * @method Grid\Column|Collection promotion_type(string $label = null)
     * @method Grid\Column|Collection refund_method(string $label = null)
     * @method Grid\Column|Collection order_number(string $label = null)
     * @method Grid\Column|Collection order_price(string $label = null)
     * @method Grid\Column|Collection order_screenshot(string $label = null)
     * @method Grid\Column|Collection review_screenshot(string $label = null)
     * @method Grid\Column|Collection review_link(string $label = null)
     * @method Grid\Column|Collection review_submit_date(string $label = null)
     * @method Grid\Column|Collection review_show_date(string $label = null)
     * @method Grid\Column|Collection review_type(string $label = null)
     * @method Grid\Column|Collection refund_status(string $label = null)
     * @method Grid\Column|Collection refund_date(string $label = null)
     * @method Grid\Column|Collection refund_money(string $label = null)
     * @method Grid\Column|Collection keyword_location(string $label = null)
     * @method Grid\Column|Collection agent_contact(string $label = null)
     * @method Grid\Column|Collection store_name(string $label = null)
     * @method Grid\Column|Collection person(string $label = null)
     * @method Grid\Column|Collection picture(string $label = null)
     * @method Grid\Column|Collection name_local(string $label = null)
     * @method Grid\Column|Collection sku(string $label = null)
     * @method Grid\Column|Collection taday_order_number(string $label = null)
     * @method Grid\Column|Collection taday_order_ammount(string $label = null)
     * @method Grid\Column|Collection today_average_price(string $label = null)
     * @method Grid\Column|Collection yesterday_order_number(string $label = null)
     * @method Grid\Column|Collection yesterday_order_ammount(string $label = null)
     * @method Grid\Column|Collection yesterday_order_price(string $label = null)
     * @method Grid\Column|Collection lastweekday_order_number(string $label = null)
     * @method Grid\Column|Collection lastweekday_order_ammount(string $label = null)
     * @method Grid\Column|Collection lastweekday_order_price(string $label = null)
     * @method Grid\Column|Collection inventory_salable(string $label = null)
     * @method Grid\Column|Collection inventory_receivable(string $label = null)
     * @method Grid\Column|Collection inventory_movable(string $label = null)
     * @method Grid\Column|Collection amz_account(string $label = null)
     * @method Grid\Column|Collection amz_sku(string $label = null)
     * @method Grid\Column|Collection fnsku(string $label = null)
     * @method Grid\Column|Collection local_name(string $label = null)
     * @method Grid\Column|Collection saler(string $label = null)
     * @method Grid\Column|Collection fba_fee(string $label = null)
     * @method Grid\Column|Collection amz_sale_commssion(string $label = null)
     * @method Grid\Column|Collection fba_current_inventory(string $label = null)
     * @method Grid\Column|Collection fba_current_transfer(string $label = null)
     * @method Grid\Column|Collection latest_transportation_unitfee(string $label = null)
     * @method Grid\Column|Collection rew_number(string $label = null)
     * @method Grid\Column|Collection rew_rate(string $label = null)
     * @method Grid\Column|Collection email_verified_at(string $label = null)
     */
    class Grid {}

    class MiniGrid extends Grid {}

    /**
     * @property Show\Field|Collection image
     * @property Show\Field|Collection date
     * @property Show\Field|Collection id
     * @property Show\Field|Collection name
     * @property Show\Field|Collection norms
     * @property Show\Field|Collection category
     * @property Show\Field|Collection price
     * @property Show\Field|Collection shop_name
     * @property Show\Field|Collection brand
     * @property Show\Field|Collection state
     * @property Show\Field|Collection added_at
     * @property Show\Field|Collection images
     * @property Show\Field|Collection year
     * @property Show\Field|Collection rating
     * @property Show\Field|Collection directors
     * @property Show\Field|Collection casts
     * @property Show\Field|Collection genres
     * @property Show\Field|Collection type
     * @property Show\Field|Collection version
     * @property Show\Field|Collection detail
     * @property Show\Field|Collection created_at
     * @property Show\Field|Collection updated_at
     * @property Show\Field|Collection is_enabled
     * @property Show\Field|Collection parent_id
     * @property Show\Field|Collection order
     * @property Show\Field|Collection icon
     * @property Show\Field|Collection uri
     * @property Show\Field|Collection extension
     * @property Show\Field|Collection user_id
     * @property Show\Field|Collection path
     * @property Show\Field|Collection method
     * @property Show\Field|Collection ip
     * @property Show\Field|Collection input
     * @property Show\Field|Collection permission_id
     * @property Show\Field|Collection menu_id
     * @property Show\Field|Collection slug
     * @property Show\Field|Collection http_method
     * @property Show\Field|Collection http_path
     * @property Show\Field|Collection role_id
     * @property Show\Field|Collection value
     * @property Show\Field|Collection username
     * @property Show\Field|Collection password
     * @property Show\Field|Collection avatar
     * @property Show\Field|Collection remember_token
     * @property Show\Field|Collection country
     * @property Show\Field|Collection currency
     * @property Show\Field|Collection COUNTRY
     * @property Show\Field|Collection COMPANY_NAME
     * @property Show\Field|Collection FC
     * @property Show\Field|Collection POSTAL_CODE
     * @property Show\Field|Collection STATES
     * @property Show\Field|Collection CITY
     * @property Show\Field|Collection ADDRESS
     * @property Show\Field|Collection TYPE
     * @property Show\Field|Collection POD
     * @property Show\Field|Collection note
     * @property Show\Field|Collection listing_id
     * @property Show\Field|Collection irobot_shipment_id
     * @property Show\Field|Collection fbaid
     * @property Show\Field|Collection fba_reference_id
     * @property Show\Field|Collection from_address
     * @property Show\Field|Collection to_country
     * @property Show\Field|Collection fba_code
     * @property Show\Field|Collection address
     * @property Show\Field|Collection postcode
     * @property Show\Field|Collection date_create_ship
     * @property Show\Field|Collection hope_arrive_date
     * @property Show\Field|Collection actural_arrive_date
     * @property Show\Field|Collection carrier_name
     * @property Show\Field|Collection tracking_num
     * @property Show\Field|Collection send_method
     * @property Show\Field|Collection status
     * @property Show\Field|Collection carrier_file
     * @property Show\Field|Collection carrier_pdf
     * @property Show\Field|Collection send_number
     * @property Show\Field|Collection irobot_id
     * @property Show\Field|Collection units_number
     * @property Show\Field|Collection unit_price
     * @property Show\Field|Collection already_send
     * @property Show\Field|Collection 备注
     * @property Show\Field|Collection admin_id
     * @property Show\Field|Collection media_group_id
     * @property Show\Field|Collection disk
     * @property Show\Field|Collection size
     * @property Show\Field|Collection file_ext
     * @property Show\Field|Collection file_name
     * @property Show\Field|Collection meta
     * @property Show\Field|Collection email
     * @property Show\Field|Collection token
     * @property Show\Field|Collection name_chinese
     * @property Show\Field|Collection name_english
     * @property Show\Field|Collection asin
     * @property Show\Field|Collection upc
     * @property Show\Field|Collection irobot_sku
     * @property Show\Field|Collection addbyuser
     * @property Show\Field|Collection unit_size
     * @property Show\Field|Collection unit_weight
     * @property Show\Field|Collection box_size
     * @property Show\Field|Collection box_weight
     * @property Show\Field|Collection numberperbox
     * @property Show\Field|Collection amz_listing
     * @property Show\Field|Collection purchasemethod
     * @property Show\Field|Collection image_column
     * @property Show\Field|Collection purchase_cost
     * @property Show\Field|Collection promotion_product_id
     * @property Show\Field|Collection promotion_type
     * @property Show\Field|Collection refund_method
     * @property Show\Field|Collection order_number
     * @property Show\Field|Collection order_price
     * @property Show\Field|Collection order_screenshot
     * @property Show\Field|Collection review_screenshot
     * @property Show\Field|Collection review_link
     * @property Show\Field|Collection review_submit_date
     * @property Show\Field|Collection review_show_date
     * @property Show\Field|Collection review_type
     * @property Show\Field|Collection refund_status
     * @property Show\Field|Collection refund_date
     * @property Show\Field|Collection refund_money
     * @property Show\Field|Collection keyword_location
     * @property Show\Field|Collection agent_contact
     * @property Show\Field|Collection store_name
     * @property Show\Field|Collection person
     * @property Show\Field|Collection picture
     * @property Show\Field|Collection name_local
     * @property Show\Field|Collection sku
     * @property Show\Field|Collection taday_order_number
     * @property Show\Field|Collection taday_order_ammount
     * @property Show\Field|Collection today_average_price
     * @property Show\Field|Collection yesterday_order_number
     * @property Show\Field|Collection yesterday_order_ammount
     * @property Show\Field|Collection yesterday_order_price
     * @property Show\Field|Collection lastweekday_order_number
     * @property Show\Field|Collection lastweekday_order_ammount
     * @property Show\Field|Collection lastweekday_order_price
     * @property Show\Field|Collection inventory_salable
     * @property Show\Field|Collection inventory_receivable
     * @property Show\Field|Collection inventory_movable
     * @property Show\Field|Collection amz_account
     * @property Show\Field|Collection amz_sku
     * @property Show\Field|Collection fnsku
     * @property Show\Field|Collection local_name
     * @property Show\Field|Collection saler
     * @property Show\Field|Collection fba_fee
     * @property Show\Field|Collection amz_sale_commssion
     * @property Show\Field|Collection fba_current_inventory
     * @property Show\Field|Collection fba_current_transfer
     * @property Show\Field|Collection latest_transportation_unitfee
     * @property Show\Field|Collection rew_number
     * @property Show\Field|Collection rew_rate
     * @property Show\Field|Collection email_verified_at
     *
     * @method Show\Field|Collection image(string $label = null)
     * @method Show\Field|Collection date(string $label = null)
     * @method Show\Field|Collection id(string $label = null)
     * @method Show\Field|Collection name(string $label = null)
     * @method Show\Field|Collection norms(string $label = null)
     * @method Show\Field|Collection category(string $label = null)
     * @method Show\Field|Collection price(string $label = null)
     * @method Show\Field|Collection shop_name(string $label = null)
     * @method Show\Field|Collection brand(string $label = null)
     * @method Show\Field|Collection state(string $label = null)
     * @method Show\Field|Collection added_at(string $label = null)
     * @method Show\Field|Collection images(string $label = null)
     * @method Show\Field|Collection year(string $label = null)
     * @method Show\Field|Collection rating(string $label = null)
     * @method Show\Field|Collection directors(string $label = null)
     * @method Show\Field|Collection casts(string $label = null)
     * @method Show\Field|Collection genres(string $label = null)
     * @method Show\Field|Collection type(string $label = null)
     * @method Show\Field|Collection version(string $label = null)
     * @method Show\Field|Collection detail(string $label = null)
     * @method Show\Field|Collection created_at(string $label = null)
     * @method Show\Field|Collection updated_at(string $label = null)
     * @method Show\Field|Collection is_enabled(string $label = null)
     * @method Show\Field|Collection parent_id(string $label = null)
     * @method Show\Field|Collection order(string $label = null)
     * @method Show\Field|Collection icon(string $label = null)
     * @method Show\Field|Collection uri(string $label = null)
     * @method Show\Field|Collection extension(string $label = null)
     * @method Show\Field|Collection user_id(string $label = null)
     * @method Show\Field|Collection path(string $label = null)
     * @method Show\Field|Collection method(string $label = null)
     * @method Show\Field|Collection ip(string $label = null)
     * @method Show\Field|Collection input(string $label = null)
     * @method Show\Field|Collection permission_id(string $label = null)
     * @method Show\Field|Collection menu_id(string $label = null)
     * @method Show\Field|Collection slug(string $label = null)
     * @method Show\Field|Collection http_method(string $label = null)
     * @method Show\Field|Collection http_path(string $label = null)
     * @method Show\Field|Collection role_id(string $label = null)
     * @method Show\Field|Collection value(string $label = null)
     * @method Show\Field|Collection username(string $label = null)
     * @method Show\Field|Collection password(string $label = null)
     * @method Show\Field|Collection avatar(string $label = null)
     * @method Show\Field|Collection remember_token(string $label = null)
     * @method Show\Field|Collection country(string $label = null)
     * @method Show\Field|Collection currency(string $label = null)
     * @method Show\Field|Collection COUNTRY(string $label = null)
     * @method Show\Field|Collection COMPANY_NAME(string $label = null)
     * @method Show\Field|Collection FC(string $label = null)
     * @method Show\Field|Collection POSTAL_CODE(string $label = null)
     * @method Show\Field|Collection STATES(string $label = null)
     * @method Show\Field|Collection CITY(string $label = null)
     * @method Show\Field|Collection ADDRESS(string $label = null)
     * @method Show\Field|Collection TYPE(string $label = null)
     * @method Show\Field|Collection POD(string $label = null)
     * @method Show\Field|Collection note(string $label = null)
     * @method Show\Field|Collection listing_id(string $label = null)
     * @method Show\Field|Collection irobot_shipment_id(string $label = null)
     * @method Show\Field|Collection fbaid(string $label = null)
     * @method Show\Field|Collection fba_reference_id(string $label = null)
     * @method Show\Field|Collection from_address(string $label = null)
     * @method Show\Field|Collection to_country(string $label = null)
     * @method Show\Field|Collection fba_code(string $label = null)
     * @method Show\Field|Collection address(string $label = null)
     * @method Show\Field|Collection postcode(string $label = null)
     * @method Show\Field|Collection date_create_ship(string $label = null)
     * @method Show\Field|Collection hope_arrive_date(string $label = null)
     * @method Show\Field|Collection actural_arrive_date(string $label = null)
     * @method Show\Field|Collection carrier_name(string $label = null)
     * @method Show\Field|Collection tracking_num(string $label = null)
     * @method Show\Field|Collection send_method(string $label = null)
     * @method Show\Field|Collection status(string $label = null)
     * @method Show\Field|Collection carrier_file(string $label = null)
     * @method Show\Field|Collection carrier_pdf(string $label = null)
     * @method Show\Field|Collection send_number(string $label = null)
     * @method Show\Field|Collection irobot_id(string $label = null)
     * @method Show\Field|Collection units_number(string $label = null)
     * @method Show\Field|Collection unit_price(string $label = null)
     * @method Show\Field|Collection already_send(string $label = null)
     * @method Show\Field|Collection 备注(string $label = null)
     * @method Show\Field|Collection admin_id(string $label = null)
     * @method Show\Field|Collection media_group_id(string $label = null)
     * @method Show\Field|Collection disk(string $label = null)
     * @method Show\Field|Collection size(string $label = null)
     * @method Show\Field|Collection file_ext(string $label = null)
     * @method Show\Field|Collection file_name(string $label = null)
     * @method Show\Field|Collection meta(string $label = null)
     * @method Show\Field|Collection email(string $label = null)
     * @method Show\Field|Collection token(string $label = null)
     * @method Show\Field|Collection name_chinese(string $label = null)
     * @method Show\Field|Collection name_english(string $label = null)
     * @method Show\Field|Collection asin(string $label = null)
     * @method Show\Field|Collection upc(string $label = null)
     * @method Show\Field|Collection irobot_sku(string $label = null)
     * @method Show\Field|Collection addbyuser(string $label = null)
     * @method Show\Field|Collection unit_size(string $label = null)
     * @method Show\Field|Collection unit_weight(string $label = null)
     * @method Show\Field|Collection box_size(string $label = null)
     * @method Show\Field|Collection box_weight(string $label = null)
     * @method Show\Field|Collection numberperbox(string $label = null)
     * @method Show\Field|Collection amz_listing(string $label = null)
     * @method Show\Field|Collection purchasemethod(string $label = null)
     * @method Show\Field|Collection image_column(string $label = null)
     * @method Show\Field|Collection purchase_cost(string $label = null)
     * @method Show\Field|Collection promotion_product_id(string $label = null)
     * @method Show\Field|Collection promotion_type(string $label = null)
     * @method Show\Field|Collection refund_method(string $label = null)
     * @method Show\Field|Collection order_number(string $label = null)
     * @method Show\Field|Collection order_price(string $label = null)
     * @method Show\Field|Collection order_screenshot(string $label = null)
     * @method Show\Field|Collection review_screenshot(string $label = null)
     * @method Show\Field|Collection review_link(string $label = null)
     * @method Show\Field|Collection review_submit_date(string $label = null)
     * @method Show\Field|Collection review_show_date(string $label = null)
     * @method Show\Field|Collection review_type(string $label = null)
     * @method Show\Field|Collection refund_status(string $label = null)
     * @method Show\Field|Collection refund_date(string $label = null)
     * @method Show\Field|Collection refund_money(string $label = null)
     * @method Show\Field|Collection keyword_location(string $label = null)
     * @method Show\Field|Collection agent_contact(string $label = null)
     * @method Show\Field|Collection store_name(string $label = null)
     * @method Show\Field|Collection person(string $label = null)
     * @method Show\Field|Collection picture(string $label = null)
     * @method Show\Field|Collection name_local(string $label = null)
     * @method Show\Field|Collection sku(string $label = null)
     * @method Show\Field|Collection taday_order_number(string $label = null)
     * @method Show\Field|Collection taday_order_ammount(string $label = null)
     * @method Show\Field|Collection today_average_price(string $label = null)
     * @method Show\Field|Collection yesterday_order_number(string $label = null)
     * @method Show\Field|Collection yesterday_order_ammount(string $label = null)
     * @method Show\Field|Collection yesterday_order_price(string $label = null)
     * @method Show\Field|Collection lastweekday_order_number(string $label = null)
     * @method Show\Field|Collection lastweekday_order_ammount(string $label = null)
     * @method Show\Field|Collection lastweekday_order_price(string $label = null)
     * @method Show\Field|Collection inventory_salable(string $label = null)
     * @method Show\Field|Collection inventory_receivable(string $label = null)
     * @method Show\Field|Collection inventory_movable(string $label = null)
     * @method Show\Field|Collection amz_account(string $label = null)
     * @method Show\Field|Collection amz_sku(string $label = null)
     * @method Show\Field|Collection fnsku(string $label = null)
     * @method Show\Field|Collection local_name(string $label = null)
     * @method Show\Field|Collection saler(string $label = null)
     * @method Show\Field|Collection fba_fee(string $label = null)
     * @method Show\Field|Collection amz_sale_commssion(string $label = null)
     * @method Show\Field|Collection fba_current_inventory(string $label = null)
     * @method Show\Field|Collection fba_current_transfer(string $label = null)
     * @method Show\Field|Collection latest_transportation_unitfee(string $label = null)
     * @method Show\Field|Collection rew_number(string $label = null)
     * @method Show\Field|Collection rew_rate(string $label = null)
     * @method Show\Field|Collection email_verified_at(string $label = null)
     */
    class Show {}

    /**
     * @method \DeMemory\DcatMediaSelector\MediaSelector mediaSelector(...$params)
     * @method \App\Admin\Extensions\Form\Input ipt(...$params)
     */
    class Form {}

}

namespace Dcat\Admin\Grid {
    /**
     * @method $this code(...$params)
     */
    class Column {}

    /**
     
     */
    class Filter {}
}

namespace Dcat\Admin\Show {
    /**
     
     */
    class Field {}
}
