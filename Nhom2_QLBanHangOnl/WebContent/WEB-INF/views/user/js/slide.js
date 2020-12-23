function next()
{
    if(vitri < 4) vitri++;
    else vitri = 0;

    var anh = document.getElementById("slideshowimg");
    anh.src="./image/p"+(vitri+1)+".png";
}
setInterval(function(){next()},3000);

// giỏ hàng


