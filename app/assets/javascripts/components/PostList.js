import React from 'react'
import Post from './Post'

const PostList = ({posts}) => (
  <div>
    <h1>Posts</h1>
    {
      posts.map(post =>
        <Post
          key={ post.id }
          { ...post }
        />)
    }
  </div>
)

export default PostList
