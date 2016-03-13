export const SET_POSTS = 'SET_POSTS'
export const LIKE_POST = 'LIKE_POST'

export function setPosts(posts) {
  return {
    type: SET_POSTS,
    posts
  }
}

export function likePost(id) {
  return {
    type: LIKE_POST,
    id
  }
}
