/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/***/ ((module) => {


class FollowToggle {
  constructor ($ele) {
    this.followButton = $ele;
    this.userId = this.followButton.attr('data-user-id');
    this.followState = this.followButton.attr('data-initial-follow-state');
    this.render();
    this.handleClick();
  }

  render () {
    if (this.followState === "unfollowed") {
      this.followButton.html("Follow!");
    } else if (this.followState === "followed"){
      this.followButton.html("Unfollow!");
    }
  }

  handleClick () {
    this.followButton.click((e) => this.clickCallback.call(this, e))
  }
  
  clickCallback (e){
    console.log(this.followState);
    if (this.followState === "unfollowed") {
      $.ajax({
        method: "POST",
        url: `/users/${this.userId}/follow`,
        data: {
          user_id: this.userId
        },
        dataType: "JSON",
        success: res => this.handleSuccess(res),
        error: error => console.log(error)
      })
    } else if (this.followState === "followed") {
      $.ajax({
        url: `/users/${this.userId}/follow`,
        method: "POST",
        data: {
          _method: "DELETE"
        },
        success: res => this.handleSuccess(res),
        error: error => console.log(error)
      })
    }
  }

  handleSuccess(res) {
    this.followState === "followed" ? this.followState = "unfollowed" : this.followState = 'followed';
    this.render()
  }
}

module.exports = FollowToggle;

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		if(__webpack_module_cache__[moduleId]) {
/******/ 			return __webpack_module_cache__[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
(() => {
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
const FollowToggle = __webpack_require__(/*! ./follow_toggle */ "./frontend/follow_toggle.js");

$(() => {
  $('.follow-toggle').each(function(idx, ele) {
    new FollowToggle($(ele))
  })
})
})();

/******/ })()
;
//# sourceMappingURL=bundle.js.map