function index () {
  const loginUser = document.getElementById("login_user");
  const optionBtn = document.getElementById("option_btn0");
  const optionLogout = document.getElementById("option_btn1");
  loginUser.addEventListener("mouseover", function(){
    this.setAttribute("style", "opacity:0.5;");
    if (optionBtn.getAttribute("style") == "display:block;"){
      optionBtn.removeAttribute("style");
    } else{
      optionBtn.setAttribute("style", "display:block;")
    }
    if (optionLogout.getAttribute("style") == "display:block;"){
      optionLogout.removeAttribute("style");
    } else{
      optionLogout.setAttribute("style", "display:block;")
    }
  })
  loginUser.addEventListener("mouseout", function(){
    this.removeAttribute("style");
  })
};

window.addEventListener("turbo:load", index)