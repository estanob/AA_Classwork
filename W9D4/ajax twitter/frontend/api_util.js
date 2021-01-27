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
    },
    searchUsers: query => {
        return $.ajax({
            url: "/users/search",
            method: "GET",
            dataType: "JSON",
            data: {
                query 
            }
        }) 
    }
}

module.exports = APIUtil;