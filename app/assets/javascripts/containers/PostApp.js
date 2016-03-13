import {bindActionCreators} from 'redux'
import {connect} from 'react-redux'
import PostList from '../components/PostList'
import * as actions from '../actions/post'

let mapStateToProps = (state) => ({posts: state.posts})
let mapDispatchToProps = (dispatch) => bindActionCreators(actions, dispatch)

export default connect(mapStateToProps, mapDispatchToProps)(PostList)
