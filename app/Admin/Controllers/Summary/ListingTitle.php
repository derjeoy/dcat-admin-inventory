<?php

namespace Dcat\Admin\Http\Controllers;

class ListingTitle
{
    public static function title($listing)
    {
        return view('listingcard.title',compact('$listing'));
    }
}
