Order_Class = function() {};
////////////////////////////////////
Order_Class.prototype = {
    //PREPARE ORDER CHOOSE ------------------------------------------------------------------
    //Prepare for 1 Product
    Prepare: function() {
        $('.OrderProductButton button').click(function() {
            productId = $('#ProductValue').attr('ProductId');
            serial = $('#ProductValue').attr('ProductSerial');
            name = $('#ProductValue').attr('ProductName');
            quantity = $('#OrderQuantity').val();
            price = $('#Product .ProductMeta .ProductPriceNew >span[itemprop]').attr('content');
            // Gia goc
            priceOld = $('#ProductValue').attr('ProductPriceOld');
            // Gia dai ly
            priceAgent = $('#ProductValue').attr('ProductPriceAgent');
            picture = $('#ProductValue').attr('Picture');
            //context = $('#Product .Context').html();
            context = '';
            if ((context == null) || (context == 'undefined') || (context == '')) context = '';
            Order.InsertProductStore(productId, serial, name, quantity, priceOld, priceAgent, price, picture, context);
        });
    },
    PrepareGroup: function() {
        $('.OrderProductButton').click(function() {
            productId = Other.GetProductIdInUrl($(this).parent().find('>a').attr('href'));
            serial = $(this).parent().find('.ProductSerial').text();
            name = $(this).parent().find('.ProductName').text();
            quantity = 1;
            price = $(this).parent().find('.ProductPriceNew').text().replace(/\D/g, '');
            picture = $(this).parent().find('figure img').attr('src').replace('_thumbs/', '');
            context = '';
            Order.InsertProductStore(productId, serial, name, quantity, price, picture, context);
        });
    },
    //FOR PRODUCTSTORE/////////////////////////////////////
    InsertProductStore: function(productId, serial, name, quantity, priceOld, priceAgent, price, picture, context) {
        //console.log(productId + "---" + serial + "---" + name + "---" + quantity + "---" + price + "---" + picture + "---" + context);
        //Create OrderView element
        $("#Dialog-Zone").html("<div class='modal-dialog modal-lg'> <div class='modal-content'> <div class='modal-header'> <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button><b class='modal-title'>ĐƠN HÀNG CỦA BẠN</b> </div> <div class='modal-body'> <div class='container-fluid'> <div class='row'> <div class='col-md-12'> <div id='OrderView'></div> </div> </div> </div> </div> <div class='modal-footer'> <div class='row'> <div class='col-md-12'> <button type='button' class='btn btn-default' data-dismiss='modal'>Mua hàng tiếp</button> <button id='OrderDeleteButton' type='button' class='btn btn-danger'>Xóa hết</button> <button id='OrderPaymentButton' type='button' class='btn btn-primary' data-dismiss='modal'>Thanh toán</button> </div> </div> </div> </div> </div>");
        //Get OrderView from jStorage
        //$.jStorage.deleteKey("OrderView");
        orderView = $.jStorage.get("OrderView");
        if ((orderView == null) || (orderView == "undefined") || (orderView == ""))
            $("#OrderView").html("<table class='table table-striped table-responsive' style='margin-bottom:0'><thead><tr><th> STT </th><th style='text-align:center'> Hình ảnh </th><th style='text-align:left;width:40%'>Tên Sản Phẩm</th><th>Số Lượng</th><th>Đơn Giá (VND)</th><th>Tổng (VND)</th><th style='text-align:center'>Xóa</th></tr></thead><tbody></tbody><tfoot><tr><th colspan='5' style='text-align:right'>Tổng cộng (VND)</th><th><span id='StoreTotal'></span></th><th style='text-align:center'><a href='javascript:void(0)' onclick='$(\"#OrderView tbody\").html(\"\"); Order.CountProductStore(); return false;'><img src='./Image/delete.png' /></a></th></tr></tfoot></table>");
        else
            Order.RenderProductStoreContext(orderView);
        //Check ProductId dupplicate
        if ($("#OrderView .ProductSerial[ProductId='" + productId + "']").length > 0) {
            quantity = parseInt($("#OrderView .ProductSerial[ProductId='" + productId + "']").parent().find(".Quantity input").val()) + parseInt(quantity);
            priceNew = parseInt($("#OrderView .ProductSerial[ProductId='" + productId + "']").parent().find(".Price input.priceNew").val().replace(/,/g, ""));
            priceAgent = parseInt($("#OrderView .ProductSerial[ProductId='" + productId + "']").parent().find(".Price input.priceAgent").val().replace(/,/g, ""));
            priceOld = parseInt($("#OrderView .ProductSerial[ProductId='" + productId + "']").parent().find(".Price input.priceOld").val().replace(/,/g, ""));
            if (quantity <= 5) {
                total = Other.NumberAddCommas("" + (quantity * priceNew));
                $("#OrderView .ProductSerial[ProductId='" + productId + "']").parent().find(".Price input.priceAgent, input.priceOld").hide();
                $("#OrderView .ProductSerial[ProductId='" + productId + "']").parent().find('input.priceNew').removeAttr('hidden').show();
            }
            /*------*/
            if (quantity >= 6 && quantity <= 9 && priceAgent > 0) {
                total = Other.NumberAddCommas("" + (quantity * priceAgent));
                $("#OrderView .ProductSerial[ProductId='" + productId + "']").parent().find(".Price input.priceNew, input.priceOld").hide();
                $("#OrderView .ProductSerial[ProductId='" + productId + "']").parent().find('input.priceAgent').removeAttr('hidden').show();
            } else total = Other.NumberAddCommas("" + (quantity * priceNew));
            /*------*/
            if (quantity >= 10 && priceOld > 0) {
                total = Other.NumberAddCommas("" + (quantity * priceOld));
                $("#OrderView .ProductSerial[ProductId='" + productId + "']").parent().find(".Price input.priceNew, input.priceAgent").hide();
                $("#OrderView .ProductSerial[ProductId='" + productId + "']").parent().find('input.priceOld').removeAttr('hidden').show();
            } else total = Other.NumberAddCommas("" + (quantity * priceNew));
            $("#OrderView .ProductSerial[ProductId='" + productId + "']").parent().find(".Quantity input").val(quantity);
            $("#OrderView .ProductSerial[ProductId='" + productId + "']").parent().find(".Total").text(total);
        } else {
            //Create Row with class: ProductStore
            row = "<tr class='ProductStore'>";
            //Create class: index (STT)
            row = row + "<td class='index'></td>";
            //Create class: ProductSerial (Product Serial and ProductId)
            row = row + "<td class='ProductSerial' ProductId='" + productId + "' style='text-align:center'>" + "<img style='width:100px' src='" + picture.replace("/Image/", "/Image/_thumbs/") + "'/>" + "</td>";
            //Create class: ProductName
            productContext = "<td style='text-align:left'>" + "<div class='ProductName'><b>" + name + " (" + serial + ")" + "</b></div>";
            //Create class: Context
            productContext = productContext + "<div class='Context' style='margin-top:20px'>" + context + "</div>";
            //Create class: Note
            productContext = productContext + "<div class='Note' style='clear:both;margin-top:20px;font-style:italic'></div>";
            productContext = productContext + "</td>";
            row = row + productContext;
            //Create class: Quantity
            row = row + "<td class='Quantity text-center'><input class='text-center' style='width:55px' type='text' value='" + quantity + "'/></td>";
            //Create class: Price
            row = row + "<td class='Price'><input class='priceNew' style='width:100px;border:none;background:none' type='text' value='" + Other.NumberAddCommas("" + price) + "' disabled/> <input class='priceOld' style='width:100px;border:none;background:none' hidden type='text' value='" + Other.NumberAddCommas("" + priceOld) + "' disabled/> <input class='priceAgent' style='width:100px;border:none;background:none' hidden type='text' value='" + Other.NumberAddCommas("" + priceAgent) + "' disabled/> </td>";
            //Create class: Total
            row = row + "<td class='Total'>" + Other.NumberAddCommas("" + (parseInt(quantity) * parseInt(price.replace(/,/g, "")))) + "</td>";
            //Create Delete Button
            row = row + "<td style='text-align:center'><a href='javascript:void(0)' onclick='$(this).parent().parent().remove();Order.CountProductStore();return false;'><img src='./Image/delete.png'/></a></td>";
            row = row + "</tr>";
            //Append Row Product
            $("#OrderView tbody").append(row);
        }
        //Popup Order View
        Order.Show();
    },
    TriggerProductStore: function() {
        //Event process of Quantity
        $(".ProductStore .Quantity input").change(function() {
            length = parseInt($(this).val());
            priceNew = parseInt($(this).parent().parent().find(".Price input.priceNew").val().replace(/,/g, ""));
            priceAgent = parseInt($(this).parent().parent().find(".Price input.priceAgent").val().replace(/,/g, ""));
            priceOld = parseInt($(this).parent().parent().find(".Price input.priceOld").val().replace(/,/g, ""));
            /*------*/
            if (length <= 5) {
                total = length * priceNew;
                $(this).parent().parent().find(".Price input.priceAgent, input.priceOld").hide();
                $(this).parent().parent().find('input.priceNew').removeAttr('hidden').show();
            }
            /*------*/
            if (length >= 6 && length <= 9 && priceAgent > 0) {
                total = length * priceAgent;
                $(this).parent().parent().find(".Price input.priceNew, input.priceOld").hide();
                $(this).parent().parent().find('input.priceAgent').removeAttr('hidden').show();
            } else total = length * parseInt($(this).parent().parent().find(".Price input.priceNew").val().replace(/,/g, ""));
            /*------*/
            if (length >= 10 && priceOld > 0) {
                total = length * priceOld;
                $(this).parent().parent().find(".Price input.priceNew, input.priceAgent").hide();
                $(this).parent().parent().find('input.priceOld').removeAttr('hidden').show();
            } else total = length * parseInt($(this).parent().parent().find(".Price input.priceNew").val().replace(/,/g, ""));
            /*------*/
            if (isNaN(total)) {
                total = 0;
                $(this).val("0");
            }
            $(this).parent().parent().find(".Total").text(Other.NumberAddCommas("" + total));
            Order.CountProductStore();
        });
        Order.CountProductStore();
    },
    GetProductStoreValue: function() {
        productStoreValue = "";
        $("#OrderView .ProductStore").each(function(index) {
            productId = $(this).find(".ProductSerial").attr("ProductId");
            quantity = $(this).find(".Quantity input").val();
            price = $(this).find(".Price input.priceNew").val().replace(/,/g, "");
            total = $(this).find(".Total").text().replace(/,/g, "");
            note = $(this).find(".Note").text().replace(/;/g, "").replace(/|/g, "");
            productStoreValue = productStoreValue + productId + ";" + quantity + ";" + price + ";" + total + ";" + note + "|";
        });
        if (productStoreValue != "") productStoreValue = productStoreValue.substring(0, productStoreValue.length - 1);
        $.jStorage.set("ProductStoreValue", productStoreValue);
    },
    GetProductStoreContext: function() {
        var $ProductStoreContext = $("#OrderView").clone(true);
        $ProductStoreContext.find(".ProductStore .Quantity input").each(function(index) {
            $(this).replaceWith("<span>" + $(this).val() + "</span>");
        });
        $ProductStoreContext.find(".ProductStore .Price input.priceNew").each(function(index) {
            $(this).replaceWith("<span>" + $(this).val() + "</span>");
        });
        return $ProductStoreContext.html();
    },
    CountProductStore: function() {
        //Rewrite Index and StoreTotal , StoreCount
        storeTotal = 0;
        storeCount = 0;
        $("#OrderView .ProductStore").each(function(index) {
            $(this).find(".index").text(index + 1);
            storeTotal = storeTotal + parseInt($(this).find(".Total").text().replace(/,/g, ""));
            storeCount = storeCount + parseInt($(this).find(".Quantity input").val().replace(/,/g, ""));
        });
        $("#StoreTotal").text(Other.NumberAddCommas("" + storeTotal));
        $(".Header-Order").text(storeCount + ' sản phẩm');
        //Update OrderTotal,OrderCount from Cookie
        /*$.cookie("OrderTotal", Other.NumberAddCommas("" + storeTotal) + " VND", {
            path: "/"
        });*/
        $.cookie("OrderTotal", storeTotal, {
            path: "/"
        });
        $.cookie("OrderCount", storeCount, {
            path: "/"
        });
        //Update OrderView from Storage
        $.jStorage.set("OrderView", Order.GetProductStoreContext());
    },
    RenderProductStoreContext: function(productStoreContext) {
        $("#OrderView").html(productStoreContext);
        $("#OrderView .ProductStore .Quantity span").each(function(index) {
            $(this).replaceWith("<input style='width:55px' type='text' value='" + $(this).text() + "'/>");
        });
        $("#OrderView .ProductStore .Price span").each(function(index) {
            $(this).replaceWith("<input class='priceNew' style='width:100px;border:none;background:none' type='text' value='" + $(this).text() + "' disabled/>");
        });
    },
    //PRINT ORDER (Not popup, only use for body of mail---------------------------------------------
    OrderPrintMail: function() {
        formName = "OrderPrintMail";
        Ajax.SelectByFormName(formName, function(data) {
            //Get $ProductStoreContext from OrderView
            var $ProductStoreContext = $("<div>" + $.jStorage.get("OrderView") + "</div>");
            $ProductStoreContext.find("table tr th:last-child").remove();
            $ProductStoreContext.find("table tr td:last-child").remove();
            //Process Data
            var $Data = $("<div>" + data + "</div>");
            $Data.find("control").each(function() {
                //<control>ProductStoreContext</control>
                //if ($(this).html().trim() == "ProductStoreContext") $(this).html("[ProductStoreContext]");
                //<control>CreateDate</control>
                var d = new Date();
                date = ("0" + d.getDate()).slice(-2) + "/" + ("0" + (d.getMonth() + 1)).slice(-2) + "/" + d.getFullYear();
                if ($(this).html().trim() == "CreateDate")
                    $(this).html(date);
            });
            //Return global variable window.OrderPrintMail
            window.OrderPrintMail = $Data.html();
        });
    },
    //PRINT ORDER------------------------------------------------------------------------
    OrderPrint: function() {
        formName = "OrderPrint";
        title = "Don-Hang";
        //Get Customer Info
        customer = ""
        if ($("#ContactName").val() != "") {
            customer = "<b>Kính gửi khách hàng:</b>";
            customer = customer + "<br>Họ tên: " + $("#ContactName").val();
            customer = customer + "<br>Công ty: " + $("#ContactCompany").val();
            customer = customer + "<br>Email: " + $("#ContactEmail").val();
            customer = customer + "<br>Điện thoại: " + $("#ContactPhone").val();
            customer = customer + "<br>Địa chỉ: " + $("#ContactAddress").val() + ", " + $("#ContactAddressDistrict").val() + ", " + $("#ContactAddressProvince").val();
            customer = "<div style='margintop:10px'>" + customer + "</div>";
        }
        //Get User Info
        user = $.cookie("UserSignature");
        if ((user == null) || (user == "undefined") || (user == "")) user = "";
        Ajax.SelectByFormName(formName, function(data) {
            //Get $ProductStoreContext from OrderView
            var $ProductStoreContext = $("<div>" + $.jStorage.get("OrderView") + "</div>");
            $ProductStoreContext.find("table tr th:last-child").remove();
            $ProductStoreContext.find("table tr td:last-child").remove();
            //Process Data
            var $Data = $("<div>" + data + "</div>");
            $Data.find("control").each(function() {
                //<control>ProductStoreContext</control>
                if ($(this).html().trim() == "ProductStoreContext") $(this).html($ProductStoreContext.html());
                //<control>Customer</control>
                if ($(this).html().trim() == "Customer") {
                    if (customer != "")
                        $(this).html(customer);
                    else
                        $(this).remove();
                }
                //<control>User</control>
                if ($(this).html().trim() == "User") {
                    if (user != "") {
                        $Data.find("#User").remove();
                        $(this).html(user);
                    } else
                        $(this).remove();
                }
                //<control>CreateDate</control>
                var d = new Date();
                date = ("0" + d.getDate()).slice(-2) + "/" + ("0" + (d.getMonth() + 1)).slice(-2) + "/" + d.getFullYear();
                if ($(this).html().trim() == "CreateDate")
                    $(this).html(date);
            });
            //Create Window
            page = "<html><head> <meta http-equiv='Content-Type' content='text/html; charset=utf-8' /> <title>" + title + "</title> <style type='text/css'> body { margin:0px; padding:0px; font-family: Arial, Tahoma, Sans-Serif} body * {font-size:14px;color:black;line-height:20px} table{border-collapse:collapse;width:100%} table, td, th{border:1px solid black;text-align:right;padding:3px} th{background:#ddd} table ul {list-style:none;padding:0px;margin-left:20px} #Print{width:900px;margin:0 auto;}</style></head><body>";
            page = page + "<div id='Print'>" + $Data.html() + "</div></body></html>";
            myWin = window.open("", "", "menubar,scrollbars,width=940,height=600,left=200,top=50");
            myWin.document.write(page);
            myWin.document.close();
            myWin = null;
        });
    },
    //PRINT ONE------------------------------------------------------------------------
    PrintOne: function(customer, user) {
        //Get $ProductStoreContext from OrderView
        var $ProductStoreContext = $("<div><table class='table table-striped table-responsive'><thead><tr><th> STT </th><th style='text-align:center'> Hình ảnh </th><th style='text-align:left;width:45%'>Tên Sản Phẩm</th><th>Số Lượng</th><th>Đơn Giá (VND)</th><th>Tổng (VND)</th></thead><tbody></tbody><tfoot><tr><th colspan='5' style='text-align:right'>Tổng cộng (VND)</th><th><span id='StoreTotal'>" + Other.NumberAddCommas("" + $("#ProductValue").attr("ProductPriceNew")) + "</span></th></tr></tfoot></table></div>");
        row = "<tr class='ProductStore'>";
        row = row + "<td class='index'>1</td>";
        row = row + "<td class='ProductSerial' style='text-align:center'>" + "<img style='width:100px' src='" + $("#ProductValue").attr("Picture") + "'/>" + "</td>";
        productContext = "<td style='text-align:left'>" + "<div class='ProductName'><b>" + $("#ProductValue").attr("ProductName") + " (" + $("#ProductValue").attr("ProductSerial") + ")" + "</b></div>";
        productContext = productContext + "<div class='Context' style='margin-top:10px'>" + $("#Product .Context").html() + "</div>";
        productContext = productContext + "<div class='Note' style='clear:both;margin-top:10px;font-style:italic'></div>";
        productContext = productContext + "</td>";
        row = row + productContext;
        row = row + "<td class='Quantity'>1</td>";
        row = row + "<td class='Price'>" + Other.NumberAddCommas("" + $("#ProductValue").attr("ProductPriceNew")) + "</td>";
        row = row + "<td class='Total'>" + Other.NumberAddCommas("" + $("#ProductValue").attr("ProductPriceNew")) + "</td>";
        row = row + "</tr>";
        //Append Row Product
        $ProductStoreContext.find("tbody").append(row);
        Ajax.SelectByFormName("OnePrint", function(data) {
            //Process Data
            var $Data = $("<div>" + data + "</div>");
            $Data.find("control").each(function() {
                //<control>ProductStoreContext</control>
                if ($(this).html().trim() == "ProductStoreContext") $(this).html($ProductStoreContext.html());
                //<control>Customer</control>
                if ($(this).html().trim() == "Customer") $(this).html(customer);
                //<control>User</control>
                if ($(this).html().trim() == "User") $(this).html(user);
                //<control>CreateDate</control>
                var d = new Date();
                date = ("0" + d.getDate()).slice(-2) + "/" + ("0" + (d.getMonth() + 1)).slice(-2) + "/" + d.getFullYear();
                if ($(this).html().trim() == "CreateDate")
                    $(this).html(date);
            });
            //Create Window
            myWin = window.open("", "", "menubar,scrollbars,width=940,height=600,left=200,top=50");
            page = "<html><head> <meta http-equiv='Content-Type' content='text/html; charset=utf-8' /> <title>Bao-Gia</title> <style type='text/css'> body { margin:0px; padding:0px; font-family: Arial, Tahoma, Sans-Serif} body * {font-size:14px;color:black;line-height:20px} table{border-collapse:collapse;width:100%} table, td, th{border:1px solid black;text-align:right;padding:3px} th{background:#ddd} table ul {list-style:none;padding:0px;margin-left:20px} #Print{width:900px;margin:0 auto;}</style></head><body>";
            page = page + "<div id='Print'>" + $Data.html() + "</div>";
            myWin.document.write(page);
            myWin.document.close();
            myWin = null;
        });
    },
    //SHOW ORDER/////////////////////////////////////
    Show: function() {
        if ($("#OrderView").length == 0) {
            $("#Dialog-Zone").html("<div class='modal-dialog modal-lg'> <div class='modal-content'> <div class='modal-header'> <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button><b class='modal-title'>ĐƠN HÀNG CỦA BẠN</b> </div> <div class='modal-body'> <div class='container-fluid'> <div class='row'> <div class='col-md-12'> <div id='OrderView'></div> </div> </div> </div> </div> <div class='modal-footer'> <div class='row'> <div class='col-md-12'> <button type='button' class='btn btn-default' data-dismiss='modal'>Mua hàng tiếp</button> <button id='OrderDeleteButton' type='button' class='btn btn-danger'>Xóa hết</button> <button id='OrderPaymentButton' type='button' class='btn btn-primary' data-dismiss='modal'>Thanh toán</button> </div> </div> </div> </div> </div>");
            orderView = $.jStorage.get("OrderView");
            if ((orderView == null) || (orderView == "undefined") || (orderView == ""))
                $("#OrderView").html("<table class='table table-striped table-responsive'><thead><tr><th> STT </th><th style='text-align:center'> Hình ảnh </th><th style='text-align:left;width:45%'>Tên Sản Phẩm</th><th>Số Lượng</th><th>Đơn Giá (VND)</th><th>Tổng (VND)</th><th style='text-align:center'>Xóa</th></tr></thead><tbody></tbody><tfoot><tr><th colspan='5' style='text-align:right'>Tổng cộng (VND)</th><th><span id='StoreTotal'></span></th><th style='text-align:center'><a href='javascript:void(0)' onclick='$(\"#OrderView tbody\").html(\"\"); Order.CountProductStore(); return false;'><img src='./Image/delete.png' /></a></th></tr></tfoot></table>");
            else
                Order.RenderProductStoreContext(orderView);
        }
        $("#Dialog-Zone").modal("show");
        $("#Dialog-Zone").on("shown.bs.modal", function(e) {
            Order.TriggerProductStore();
            $("#OrderDeleteButton").click(function() {
                $("#OrderView tbody").html("");
                Order.CountProductStore();
            });
            $("#OrderPaymentButton").click(function() {
                /*if (($.cookie("OrderCount") > 0)) {*/
                Order.GetProductStoreValue();
                Order.OrderPayment();
                var position = $('#Wraper-Order').offset();
                $('body,html').animate({
                    scrollTop: position.top - 30
                }, 1500);
                /*}
                else {
                  alert("Giỏ hàng của bạn đang trống, bạn vui lòng đặt hàng sản phẩm");
                }*/
            });
        })
        $("#Dialog-Zone").on("hidden.bs.modal", function(e) {
            $("#Dialog-Zone").html("");
        })
    },
    //ORDER CHECK  //////////////////////////////////
    OrderCheck: function(customerId, userId, userIdReference, productStoreValue, contextIncluded, couponCode, callback) {
        //Call Ajax
        postValue = "&CustomerId=" + customerId + "&UserId=" + userId + "&UserIdReference=" + userIdReference + "&ContextIncluded=" + contextIncluded + "&CouponCode=" + couponCode + "&ProductStoreValue=" + productStoreValue;
        classPath = "Main.BL.OrderBL";
        methodName = "OrderCheckByWeb";
        $.ajax({
            url: "Handler.ashx",
            dataType: "json",
            data: "ClassPath=" + classPath + "&MethodName=" + methodName + postValue,
            type: "POST",
            timeout: 90000,
            beforeSend: function() {},
            success: function(result) {
                callback(result);
            },
            error: function(xhr, message, ex) {},
            complete: function() {}
        });
    },
    //LOAD ORDER FRAME------------------------------------------------------------------
    OrderPayment: function() {
        //Render the Order after OrderCheck
        Order.OrderCheck("-1", "-1", "-1", $.jStorage.get("ProductStoreValue"), "false", "", function(result) {
            productStoreContextZone = result.Data + "<div id='CouponCodeZone' class='row'><div class='col-md-5'><div class='input-group'> <input id='CouponCode' type='text' class='form-control' placeholder='Mã khuyến mãi nếu có'> <span class='input-group-btn'> <button id='CouponCodeButton' class='btn btn-default' type='button'>Xác nhận</button> </span> </div></div><div id='CouponCodeAlert' class='col-md-7'></div></div>";
            //Render OrderPayment context
            Ajax.SelectByFormName("OrderPayment", function(data) {
                //Process Data
                var $Data = $("<div>" + data + "</div>");
                $Data.find("control").each(function() {
                    //<control>ProductStoreContext</control>
                    if ($(this).html().trim() == "ProductStoreContext") $(this).html(productStoreContextZone);
                });
                //Render Form
                $("#Wraper-Order").html('<div class="container">' + $Data.html() + '</div>');
                $(".zoomContainer, #HomeSlide").remove();
                //Create window.OrderPrintMail variable to send mail
                Order.OrderPrintMail();
                //Get Customer Info from jStorage
                if (($.jStorage.get("ContactName") != null) && ($.jStorage.get("ContactName") != "undefined") && ($.jStorage.get("ContactName") != "")) {
                    $("#ContactName").val($.jStorage.get("ContactName"));
                    $("#ContactCompany").val($.jStorage.get("ContactCompany"));
                    $("#ContactEmail").val($.jStorage.get("ContactEmail"));
                    $("#ContactPhone").val($.jStorage.get("ContactPhone"));
                    $("#ContactAddress").val($.jStorage.get("ContactAddress"));
                    $("#ContactNote").val($.jStorage.get("ContactNote"));
                    $("#ContactAddressProvince").val($.jStorage.get("ContactAddressProvince"));
                    //List.ListDistrictByProvince($("#ContactAddressProvince"), $("#ContactAddressDistrict"), $.jStorage.get("ContactAddressDistrict"));
                    $("#OrderTime").val($.jStorage.get("OrderTime"));
                }
                //Bind Event
                $("#CaptchaReLoad").click(function() {
                    $("#CaptchaImage").attr("src", "Captcha.aspx?" + Math.random());
                });
                $("#OrderPrint").click(function() {
                    Order.OrderPrint();
                    return false;
                });
                $("#CouponCodeButton").click(function() {
                    productStore = $.jStorage.get("ProductStoreValue");
                    couponCode = jQuery.trim($("#CouponCode").val());
                    $("#CouponCodeZone").appendTo("#Dialog-Zone");
                    Order.OrderCheck("-1", "-1", "-1", productStore, "false", couponCode, function(result) {
                        $("#ProductStoreContext").html(result.Data);
                        $("#CouponCodeZone").appendTo("#ProductStoreContext");
                        if ((couponCode != "") && (result.ErrorType == 0)) $("#CouponCodeAlert").html("<div style='height:34px;padding:5px' class='alert alert-success' role='alert'>Mã voucher của bạn hợp lệ, có hiệu lực khi xác nhận mua hàng</div>");
                        if ((couponCode != "") && (result.ErrorType == 1)) $("#CouponCodeAlert").html("<div style='height:34px;padding:5px' class='alert alert-danger' role='alert'>Mã voucher của bạn không thể sử dụng, vui lòng kiểm tra lại</div>");
                    });
                });
                $("#OrderSubmit").click(function() {
                    if (Other.InputValidator($("#OrderForm"))) {
                        captcha = jQuery.trim($('#CaptchaValue').val());
                        type = "Đơn hàng";
                        saleType = "Lẻ";
                        paymentStatus = "Chưa thu";
                        orderNote = "";
                        couponCode = "";
                        mapPoint = "";
                        userIdReference = "-1";
                        topLevel = "1";
                        userId = "-1";
                        customerId = "-1";
                        contextIncluded = "false";
                        transferTime = '';
                        contactCompanyPhone = '';
                        contactFax = '';
                        contactAddressWard = '';
                        contactTax = '';
                        contactCompanyAddress = '';
                        //Get Order fields
                        contactName = jQuery.trim($("#ContactName").val());
                        contactCompany = jQuery.trim($("#ContactCompany").val());
                        contactEmail = jQuery.trim($("#ContactEmail").val());
                        contactPhone = jQuery.trim($("#ContactPhone").val());
                        contactAddress = jQuery.trim($("#ContactAddress").val());
                        contactAddressProvince = jQuery.trim($("#ContactAddressProvince").val());
                        contactAddressDistrict = jQuery.trim($("#ContactAddressDistrict").val());
                        contactNote = jQuery.trim($("#ContactNote").val());
                        orderPayment = jQuery.trim($("#OrderPayment").val());
                        orderTime = jQuery.trim($("#OrderTime").val());
                        productStoreValue = $.jStorage.get("ProductStoreValue");
                        productStoreContext = encodeURIComponent($.jStorage.get("OrderView"));
                        price = jQuery.trim($("#StoreTotal").text().replace(/,/g, ""));
                        //Process mail body
                        customer = "<b>Kính gửi khách hàng:</b>";
                        customer = customer + "<br>Họ tên: " + contactName;
                        customer = customer + "<br>Công ty: " + contactCompany;
                        customer = customer + "<br>Email: " + contactEmail;
                        customer = customer + "<br>Điện thoại: " + contactPhone;
                        customer = customer + "<br>Địa chỉ: " + contactAddress + ", " + contactAddressDistrict + ", " + contactAddressProvince;
                        customer = "<div style='margintop:10px'>" + customer + "</div>";
                        var $Tmp = $("<div>" + window.OrderPrintMail + "</div>");
                        $Tmp.find("control").each(function() {
                            //<control>Customer</control>
                            if ($(this).html().trim() == "Customer") $(this).html(customer);
                        });
                        productStoreContextEmail = encodeURIComponent($Tmp.html());
                        console.log(productStoreContextEmail);
                        //Call Ajax
                        postValue = "&Captcha=" + captcha + "&CustomerId=" + customerId + "&CouponCode=" + couponCode + "&OrderType=" + type + "&OrderPayment=" + orderPayment + "&TransferTime=" + transferTime + "&ContactName=" + contactName + "&ContactEmail=" + contactEmail + "&ContactPhone=" + contactPhone + "&ContactCompanyPhone=" + contactCompanyPhone + "&ContactFax=" + contactFax + "&ContactAddress=" + contactAddress + "&ContactAddressProvince=" + contactAddressProvince + "&ContactAddressDistrict=" + contactAddressDistrict + "&ContactAddressWard=" + contactAddressWard + "&ContactTax=" + contactTax + "&ContactCompany=" + contactCompany + "&ContactCompanyAddress=" + contactCompanyAddress + "&MapPoint=" + mapPoint + "&ProductStoreValue=" + productStoreValue + "&ContactNote=" + contactNote + "&OrderNote=" + orderNote + "&ProductStoreContext=" + productStoreContext + "&Price=" + price + "&ContextIncluded=" + contextIncluded + "&ProductStoreContextEmail=" + productStoreContextEmail;
                        classPath = "Main.BL.OrderBL";
                        methodName = "OrderInsertByWeb";
                        $.ajax({
                            url: "Handler.ashx",
                            dataType: "json",
                            data: "ClassPath=" + classPath + "&MethodName=" + methodName + postValue,
                            type: "POST",
                            timeout: 90000,
                            beforeSend: function() {
                                $("#OrderAlert").html("<b>Vui lòng chờ trong giây lát ...</b>");
                            },
                            success: function(result) {
                                if (result.Success == "True") {
                                    //Get OrderCode
                                    orderCode = 9000000 + parseInt(result.SuccessValue);
                                    //Show Order info
                                    $("#Wraper-Order").html("<div class='alert alert-info' role='alert' style='font-size:14pt;text-align:center'>Đặt hàng thành công, mã đặt hàng của bạn là: <b style='color:red'>" + orderCode + "</b><br><br>Chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất.</div>");
                                    //Reset Order
                                    $("#OrderView tbody").html("");
                                    Order.CountProductStore();
                                    //Set Customer Info to jStorage
                                    $.jStorage.set("ContactName", contactName);
                                    $.jStorage.set("ContactCompany", contactCompany);
                                    $.jStorage.set("ContactEmail", contactEmail);
                                    $.jStorage.set("ContactPhone", contactPhone);
                                    $.jStorage.set("ContactNote", contactNote);
                                    $.jStorage.set("ContactAddress", contactAddress);
                                    $.jStorage.set("ContactAddressProvince", contactAddressProvince);
                                    $.jStorage.set("ContactAddressDistrict", contactAddressDistrict);
                                    $.jStorage.set("OrderTime", orderTime);
                                } else {
                                    if (result.ErrorType == "1") {
                                        $("#CaptchaValue").val("");
                                        $("#CaptchaImage").attr("src", "Captcha.aspx?" + Math.random());
                                        $("#CaptchaValue").css("border", "1px solid red");
                                        $("#OrderAlert").html("<b style='color:red'>Sai mã xác nhận</b>");
                                        $("#CaptchaImage").attr("src", "Captcha.aspx");
                                    }
                                }
                            },
                            error: function(xhr, message, ex) {},
                            complete: function() {}
                        });
                    } else {
                        $("#OrderAlert").html("<b style='color:red'>Vui lòng kiểm tra lại thông tin</b>");
                    }
                });
            });
        });
    }
};
var Order = new Order_Class();
Other_Class = function() {};
Other_Class.prototype = {
    Process_isMobileDevice: function() {
        return navigator.userAgent.match(/Android/i) || navigator.userAgent.match(/BlackBerry/i) || navigator.userAgent.match(/iPhone|iPad|iPod/i) || navigator.userAgent.match(/Opera Mini/i) || navigator.userAgent.match(/IEMobile/i) ? !0 : !1
    },
    GetHashVariable: function(variable) {
        hash = window.location.hash;
        result = '';
        if (hash != '') {
            vars = hash.split('&');
            for (i = 0; i < vars.length; i++) {
                pair = vars[i].split('=');
                if (pair[0] == variable) {
                    result = pair[1];
                    return result;
                }
            }
        }
        return result;
    },
    SetHashVariable: function(variable, value) {
        hash = window.location.hash;
        if ((variable == 'tab') && (hash == '')) {
            hash = '#&tab=0';
        }
        old = '';
        vars = hash.split('&');
        for (i = 0; i < vars.length; i++) {
            pair = vars[i].split('=');
            if (pair[0] == variable) {
                old = pair[1];
            }
        }
        hash = hash.replace(variable + '=' + old, variable + '=' + value);
        window.location.hash = hash;
    },
    GetUrlVariable: function(variable) {
        url = window.location.href;
        result = '';
        vars = url.split('/');
        for (i = 0; i < vars.length; i++) {
            pair = vars[i].split('=');
            if (pair[0] == variable) {
                result = pair[1];
                return result;
            }
        }
        return result;
    },
    ProductFeatureByClass: function(className) {
        $('.' + className).each(function() {
            result = '';
            array = $(this).text().split(';');
            for (i = 0; i < array.length; i++) {
                subarray = array[i].split(':');
                result = result + '<div><b>' + subarray[0] + '</b>';
                if (subarray.length == 2)
                    result = result + '<b>:</b>' + subarray[1];
                result = result + '</div>';
            }
            $(this).html(result);
        });
    },
    ChatLink: function(selector, type, text) {
        url = encodeURIComponent($(location).attr('href'));
        $(selector).each(function() {
            if (type == 'yahoo')
                $(this).attr('href', $(this).attr('href') + '&m=' + encodeURIComponent(text) + url);
            if (type == 'skype')
                $(this).attr('href', $(this).attr('href') + '?chat&topic=' + encodeURIComponent(text) + url);
        });
    },
    Wrapper: function(selector, number) {
        for (var i = 0; i < $(selector).length; i += number) {
            $(selector).slice(i, i + number).wrapAll('<div class=\'row\'>');
        }
    },
    Wrapper_Customer: function(selector, classadd, row, number) {
        for (var i = 0; i < $(selector).length; i += number) {
            $(selector).slice(i, i + number).addClass(classadd);
            $(selector).slice(i, i + number).wrapAll("<div class='" + row + "'/>");
        }
    },
    Wrapper_Not_Col: function(selector, number) {
        for (var i = 0; i < $(selector).length; i += number) {
            $(selector).slice(i, i + number).wrapAll('<div class=\'row\'/>');
        }
    },
    SaleTagPercent: function(e, t, r) {
        if (parseInt(e) < parseInt(t)) {
            var i = 0;
            return i = 0 == r ? Math.floor(parseInt(e) / 1000 * 100 / parseInt(t / 1000) - 100) : Math.abs(Math.floor(parseInt(e) / 1000 * 100 / parseInt(t / 1000) - 100)),
                isFinite(i) || (i = 0),
                i
        }
    },
    GetProductIdInUrl: function(url) {
        id = url.split('-');
        id = id[id.length - 1].replace('.html', '');
        return id;
    },
    Menu_Home_Product: function(selector, number) {
        menu = window.menuTop;
        html = $(menu).find('> li:nth-child(' + number + ') > ul').html();
        $(selector).find('nav > ul').html(html);
        $(selector).each(function(i, element) {
            $(element).find('.navbar-toggler').attr('data-target', '#sub-navbar-' + (i + number));
            $(element).find('.sub-category-wapper').attr('id', 'sub-navbar-' + (i + number));
        });
    },
    youtubeThumbnailImage: function(url, size) {
        if (url === null) {
            return '';
        }
        size = (size === null) ? 'big' : size;
        var vid;
        var results;
        results = url.match('[\\?&]v=([^&#]*)');
        vid = (results === null) ? url : results[1];
        if (size == '') {
            return 'http://img.youtube.com/vi/' + vid + '/0.jpg';
        } else {
            return 'http://img.youtube.com/vi/' + vid + '/' + size + '.jpg';
        }
    },
    LoadCookie: function(element, cookieName) {
        try {
            cookieContent = $.cookie(cookieName);
            if ((cookieContent != null) && (cookieContent != '')) {
                element.css('display', '');
                array = cookieContent.split('|');
                element.html('<div class=\'row SideBar-Title\'><div></div> <h3 style=\'text-decoration: none; display: inline; font-size: 14px; font-weight: normal; line-height: normal;\'> <span><span>Sản phẩm </span>đã xem</span> </h3></div><ul>' + array.join('') + '</ul>');
            } else {
                element.css('display', 'none');
            }
        } catch (err) {}
    },
    SetCookie: function(element, cookieName, value) {
        try {
            array = [];
            cookieContent = $.cookie(cookieName);
            if ((cookieContent != null) && (cookieContent != '')) {
                if (cookieContent.indexOf(value) == -1) {
                    array = cookieContent.split('|');
                }
                if (array.length > 9) array.pop();
            }
            array.unshift(value);
            if (array.length > 0) $.cookie(cookieName, array.join('|'), {
                expires: 15,
                path: '/'
            });
            Other.LoadCookie(element, cookieName);
        } catch (err) {}
    },
    DeleteCookie: function(element, cookieName) {
        $.cookie(cookieName, null, {
            path: '/'
        });
    },
    DisableCopy: function() {
        jQuery(document).bind('contextmenu', function(e) {
            e.preventDefault();
            alert('Đây là nội dung có bản quyền của ' + window.location.hostname);
        });
        Other.DisableSelection(document.body);
        $('img').bind('dragstart', function(event) {
            event.preventDefault();
        });
        jQuery(document).bind('dragstart', function(event) {
            event.preventDefault();
        });
        jQuery(document).ready(function() {
            var ctlPressed = false;
            var ctl = 17;
            var c = 67;
            jQuery(document).keydown(function(e) {
                if (e.keyCode == ctl)
                    ctlPressed = true;
            }).keyup(function(e) {
                if (e.keyCode == ctl)
                    ctlPressed = false;
            });
            jQuery('.your-no-copy-area').keydown(function(e) {
                if (ctlPressed && e.keyCode == c)
                    return false;
            });
        });
    },
    DisableSelection: function(target) {
        if (typeof target.onselectstart != 'undefined')
            target.onselectstart = function() {
                return false
            }
        else if (typeof target.style.MozUserSelect != 'undefined')
            target.style.MozUserSelect = 'none'
        else
            target.onmousedown = function() {
                return false
            }
        target.style.cursor = 'default'
    },
    InputValidator: function(element) {
        result = true;
        element.find('.form-control[validator]').each(function() {
            error = true;
            message = '';
            value = $(this).val().trim();
            if ((value == '') || (value == null)) {
                error = false;
                message = 'Bạn phải nhập vào dữ liệu';
            } else {
                array = $(this).attr('validator').split('-');
                switch (array[0]) {
                    case 'id':
                        if (value == '0') {
                            error = false;
                            message = 'Phải chọn 1 giá trị';
                        }
                        break;
                    case 'text':
                        if (array[1] != null) {
                            if (value.length > parseInt(array[1])) {
                                error = false;
                                message = ('Số ký tự: ' + array[1]);
                            }
                        }
                        break;
                    case 'number':
                        if (isNaN(value.replace(/,/g, ''))) {
                            error = false;
                            message = 'Phải là số';
                        }
                        break;
                    case 'email':
                        var emailRegex = new RegExp(/^([\w\.\-]+)@([\w\-]+)((\.(\w){2,4})+)$/i);
                        if (!emailRegex.test(value)) {
                            error = false;
                            message = 'Định dạng email';
                        }
                        break;
                }
            }
            if (error == false) {
                result = false;
                $(this).css('border', '1px solid red');
            } else {
                $(this).css('border', '1px solid #ccc');
            }
        });
        return result;
    },
    NumberAddCommas: function(nStr) {
        nStr = nStr.replace(/,/g, '');
        nStr += '';
        nStr = '' + (parseFloat(nStr) - 0);
        if (nStr == 'NaN') return '';
        x = nStr.split('.');
        x1 = x[0];
        x2 = x.length > 1 ? '.' + x[1] : '';
        var rgx = /(\d+)(\d{3})/;
        while (rgx.test(x1)) {
            x1 = x1.replace(rgx, '$1' + ',' + '$2');
        }
        return x1 + x2;
    },
    IsNumberKeyDot: function(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode;
        if (charCode != 46) {
            if ((charCode > 31) && (charCode < 48 || charCode > 57))
                return false;
        }
        return true;
    },
    IsNumberKey: function(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode;
        if ((charCode > 31) && (charCode < 48 || charCode > 57))
            return false;
        return true;
    },
    DecodeUnicode: function(str) {
        str = str.toLowerCase();
        str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, 'a');
        str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, 'e');
        str = str.replace(/ì|í|ị|ỉ|ĩ/g, 'i');
        str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, 'o');
        str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, 'u');
        str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, 'y');
        str = str.replace(/đ/g, 'd');
        str = str.replace(/!|@|%|\^|\*|\(|\)|\+|\=|\<|\>|\?|\/|,|\.|\:|\;|\'| |\"|\&|\#|\[|\]|~|$|_/g, '-');
        str = str.replace(/^\-+|\-+$/g, '');
        return str;
    },
    DecodeUnicodeToAscii: function(str) {
        str = str.toLowerCase();
        str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, 'a');
        str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, 'e');
        str = str.replace(/ì|í|ị|ỉ|ĩ/g, 'i');
        str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, 'o');
        str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, 'u');
        str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, 'y');
        str = str.replace(/đ/g, 'd');
        return str;
    },
    getScrollTop: function() {
        if (document.documentElement.scrollTop)
            return document.documentElement.scrollTop;
        return document.body.scrollTop;
    }
};
var Other = new Other_Class();