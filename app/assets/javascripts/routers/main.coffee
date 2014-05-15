define ['backbone'
        'react'
        'ui/posts/wrap'
        'ui/posts/show'
        'ui/posts/form'
        'collections/posts'
        'models/post'], (Backbone
        React
        PostsWrap
        Post
        PostForm
        PostsCollection
        PostModel) ->

  class MainRouter extends Backbone.Router

    routes:
      "posts/:id"      : "posts_show"
      ""               : "posts_index"

    # actions
    posts_index: ->
      posts = new PostsCollection
      # render our UI component, passing in a collection
      @unmountComponents()
      React.renderComponent(
        PostForm(
          posts: posts
        ),
        document.getElementById('form')
      )
      React.renderComponent(
        PostsWrap(
          posts: posts
        ),
        document.getElementById('content')
      )

    posts_show: (id) ->
      console.log "HI", Backbone.RelationalModel
      post = new PostModel.findOrCreate(id: id)
      # render our UI component, passing in a model
      @unmountComponents()
      React.renderComponent(
        Post(
          post: post
          standalone: true
        ),
        document.getElementById('content')
      )

    # 'helper' methods
    unmountComponents: ->
      React.unmountComponentAtNode(document.getElementById('content'))
      if document.getElementById('form')
        React.unmountComponentAtNode(document.getElementById('form'))
