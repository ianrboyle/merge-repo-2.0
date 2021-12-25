<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png" />
    <h1>{{ message }}</h1>

    <!-- Post Title:
    <input type="text" v-model="postTitle" />
    Post Content:
    <input type="text" v-model="postContent" /> -->
    <!-- <button v-on:click="createPost()">Create New Post</button> -->
  </div>
</template>

<script>
// @ is an alias to /src

export default {
  data: function () {
    return {
      message: "Welcome to Ian's Blog!",
    };
  },
};
</script>
