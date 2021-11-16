<template>
  <div class="posts">
    <h1>This is a posts page</h1>
    <div class="container">
      <div class="row">
        <div class="col">Column</div>
        <div class="col">Column</div>
        <div class="col">Column</div>
      </div>

      <div v-for="post in posts" :key="post.id">
        <div class="card" style="width: 18rem">
          <img :src="post.image" class="card-img-top" alt="..." />
          <div class="card-body">
            <h5 class="card-title">{{ post.title }}</h5>
            <p class="card-text"></p>
            <router-link v-bind:to="`posts/${post.id}`">
              <button type="button" class="btn btn-primary">More Info</button>
            </router-link>
          </div>
        </div>

        <!-- <h3>{{ post.title }}</h3>
      <router-link v-bind:to="`posts/${post.id}`">
        <img :src="post.image" :alt="post.title" />
      </router-link>
    </div> -->
      </div>
    </div>
  </div>
</template>
<style>
img {
  width: 250px;
}
</style>
<script>
// @ is an alias to /src
import axios from "axios";
export default {
  data: function () {
    return {
      message: "Welcome to Ian's Blog!",
      posts: [],
      currentPost: {},
    };
  },
  created: function () {
    this.indexPosts();
  },

  methods: {
    indexPosts: function () {
      axios.get("http://localhost:3000/posts").then((response) => {
        this.posts = response.data;
        console.log("Success", response.data);
      });
    },
    showPosts: function (post) {
      this.currentPost = post;
      console.log(this.currentPost, post);
      document.querySelector("#post-details").showModal();
    },
    // createPost: function () {},
  },
};
</script>
