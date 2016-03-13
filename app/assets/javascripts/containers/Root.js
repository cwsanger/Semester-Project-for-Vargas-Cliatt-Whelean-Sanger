import React, {Component} from 'react'
import {createStore} from 'redux'
import {Provider} from 'react-redux'
import PostApp from './PostApp'
import postReducer from '../reducers/post'
import {setPosts} from '../actions/post'

const store = createStore(postReducer)

class Root extends Component {
  componentWillMount() {
    store.dispatch(setPosts(this.props.posts))
  }

  render() {
    return (
      <Provider store={ store }>
        <PostApp />
      </Provider>
    )
  }
}

export default Root
