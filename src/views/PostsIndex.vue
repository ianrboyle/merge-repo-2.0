<template>
  <div class="posts">
    <h1>This is a posts page</h1>
    <div v-for="post in posts" :key="post.id">
      <h3>{{ post.title }}</h3>
      <router-link v-bind:to="`posts/${post.id}`">
        <img :src="post.image" :alt="post.title" />
      </router-link>
      <!-- <button v-on:click="showPosts(post)">Show Me More!</button> -->
    </div>
    <!-- <dialog id="post-details">
      <form method="dialog">
        <h2>{{ currentPost.title }}</h2>
        <p>{{ currentPost.body }}</p>

        <button>Close</button>
      </form>
    </dialog> -->
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
