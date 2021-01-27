const APIUtil = require('./api_util')

class UsersSearch {
    constructor($ele) {
        this.el = $ele
        this.input = $ele.children('input[type=text]');
        this.result = $ele.children('ul');
        this.handleInput()
    }

    handleInput() {
        $(this.input).on('input', function(e) {
            console.log($(e.currentTarget).val());
            APIUtil.searchUsers(e.currentTarget.val())
        })
    }
}

module.exports = UsersSearch;