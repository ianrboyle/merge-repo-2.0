<template>
  <div class="posts-show">
    <h1>This is an individual post's page</h1>
    <h3>{{ post.title }}</h3>
    <img :src="post.image" :alt="post.title" />
    <br />
    <p>{{ post.body }}</p>
    <router-link to="/">Home Page</router-link>
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
      post: {},
    };
  },
  created: function () {
    axios.get("http://localhost:3000/posts/1").then((response) => {
      this.post = response.data;
      console.log("Success", response.data);
    });
  },

  methods: {},
};
</script>
