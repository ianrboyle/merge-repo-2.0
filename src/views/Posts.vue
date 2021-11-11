<template>
  <div class="posts">
    <h1>This is a posts page</h1>
    <div v-for="post in posts" :key="post.id">
      <h5>{{ post.title }}</h5>
      <button v-on:click=""></button>
      <dialog id="poost-details">
        <form method="dialog">
          <h1>Post Info</h1>
        </form>
      </dialog>
    </div>
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
    };
  },
  created: function () {
    this.getPosts();
  },

  methods: {
    getPosts: function () {
      axios.get("http://localhost:3000/posts").then((response) => {
        this.posts = response.data;
        console.log("Success", response.data);
      });
    },
    showPost: function (post) {},
    // createPost: function () {},
  },
};
</script>
