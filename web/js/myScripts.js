function doPost(pid,uid){
    console.log("post id: "+pid);
    console.log("user id: "+uid);
    
    const obj = {
        pid : pid,
        uid : uid,
        operation : "like"
    };
    
    $.ajax({
        url: "LikeServlet",
        data: obj,
        success: function (data, textStatus, jqXHR) {
            console.log("success - data: "+data);
            if(data.trim() === "done"){
                let c = $(".like-counter").html();
                console.log("c: "+c);
                c++;
                $(".like-counter").html(" "+c);
                console.log("c: "+c);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log("error - data: "+data);
        }
    });
}


