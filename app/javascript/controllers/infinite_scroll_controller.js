import { Controller } from "@hotwired/stimulus"
import "Jquery"

export default class extends Controller {
  static targets= ['entries', 'pagination']
  connect() {
    console.log("pagy controller")
  }

  scroll(){
    let url =   this.paginationTarget.querySelector("a[rel='next']").url
    var body= document.body, html = document.documentElement
    var hight = Math.max(body.scrollHeight, body.offsetHeight, html.clientHeight, html.scrollHeight, html.offsetHeight)
    if (window.pageYOffset >= hight - window.innerHeight - 100){
      console.log('bottom');
      this.loadMore(url)
    }
  }
  loadMore(url){
    $.aja({
      type: 'Get',
      url: url,
      dataType: 'json',
      success:(data)=>{
        console.log(data);
      }

    })

  }
}
