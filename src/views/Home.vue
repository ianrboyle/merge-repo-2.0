<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png" />
    <h1>{{ message }}</h1>
    <div v-for="post in posts" :key="post.id">
      <h1>{{ post }}</h1>
    </div>
    <!-- Post Title:
    <input type="text" v-model="postTitle" />
    Post Content:
    <input type="text" v-model="postContent" /> -->
    <!-- <button v-on:click="createPost()">Create New Post</button> -->
  </div>
</template>

<script>
// @ is an alias to /src
import axios from "axios";
export default {
  data: function () {
    return {
      message: "Welcome to Ian's Blog!",
      posts: [],
      // newRecipeParams: {},
      // currentRecipe: {},
    };
  },
  created: {
    function() {
      this.getPosts();
    },
  },
  methods: {
    getPosts: function () {
      axios.get("http://localhost:3000/posts").then((response) => {
        console.log("Success", response.data);
        this.posts = response.data;
      });
    },
    createPost: function () {},
  },
};
</script>
