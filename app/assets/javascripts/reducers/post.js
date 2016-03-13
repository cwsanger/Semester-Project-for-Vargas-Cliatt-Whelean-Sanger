import {SET_POSTS} from '../actions/post'

export default function post(state = {posts: []}, action) {
  switch(action.type) {
    case SET_POSTS:
      const posts = action.posts
      return {...state, posts}
  }

  return state
}
