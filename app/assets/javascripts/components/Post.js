import React from 'react'

const Post = ({body, like}) => (
  <div>
    <p>{ body }</p>
    <p>Like Count: { like }</p>
  </div>
)

export default Post
