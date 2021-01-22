/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/api_util.js":
/*!******************************!*\
  !*** ./frontend/api_util.js ***!
  \******************************/
/***/ (function(module) {

const APIUtil = {
    followUser: id => {
        return new Promise ((resolve, reject) => {
            $.ajax({
                method: "POST",
                url: `/users/${id}/follow`,
                data: {
                    user_id: this.userId
                },
                dataType: "JSON",
                success: res => resolve(res),
                error: error => reject(error)
            })
        })
    },
    unfollowUser: id => {
        return new Promise((resolve, reject) => {
            $.ajax({
                url: `/users/${id}/follow`,
                method: "DELETE",
                dataType: "JSON",
                success: res => resolve(res),
                error: error => reject(error)
            })
        })
    }
}

module.exports = APIUtil;

/***/ }),

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

const APIUtil = __webpack_require__(/*! ./api_util */ "./frontend/api_util.js")

class FollowToggle {
  constructor ($ele) {
    this.followButton = $ele;
    this.userId = this.followButton.attr('data-user-id');
    this.followState = this.followButton.attr('data-initial-follow-state');
    this.render();
    this.handleClick();
  }

  render () {
    console.log(this.followState);
    if (this.followState === "unfollowed") { //<= resolved
      this.followButton.prop("disabled", false);
      this.followButton.html("Follow!");
    } else if (this.followState === "followed"){ //<= resolved
      this.followButton.prop("disabled", false);
      this.followButton.html("Unfollow!");
    } else { // disable because we're following/unfollowing 
    // ^ pending state
      this.followButton.prop("disabled", true);
    }
  }

  handleClick () {
    this.followButton.click((e) => {
      if (this.followState === "unfollowed") {
        this.followState = "following";
        this.render();
        APIUtil.followUser(this.userId)
        .then(res => this.handleSuccess(res))
        .catch(error => console.log(error));
      } else if (this.followState === "followed") {
        this.followState = "unfollowing";
        this.render();
        APIUtil.unfollowUser(this.userId)
          .then(res => this.handleSuccess(res))
          .catch(error => console.log(error));
      }
    })
  }

  handleSuccess(res) {
    if (this.followState === "following") this.followState = "unfollowed";
    if (this.followState === "unfollowing") this.followState = "followed";
    this.followState === "followed" ? this.followState = "unfollowed" : this.followState = 'followed';
    this.render();
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
/******/ 		__webpack_modules__[moduleId].call(module.exports, module, module.exports, __webpack_require__);
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