<template>
  <div class="posts-new">
    <form v-on:submit.prevent="createPost()">
      <h1>Create New Post!</h1>
      <ul>
        <li v-for="error in errors" v-bind:key="error">{{ error }}</li>
      </ul>
      <div>
        <label>Title:</label>
        <input type="text" v-model="newPostParams.title" />
      </div>
      <div>
        <label>Content:</label>
        <!-- <input type="text" v-model="newPostParams.body" /> -->
        <textarea cols="100" rows="5" v-model="newPostParams.body"></textarea>
      </div>
      <div>
        <label>Image:</label>
        <input type="text" v-model="newPostParams.image" />
      </div>
      <input type="submit" value="Submit" />
    </form>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data: function () {
    return {
      newPostParams: {},
      errors: {},
    };
  },
  methods: {
    createPost: function () {
      console.log("making some posts");
      axios
        .post("/posts", this.newPostParams)
        .then(() => {
          this.$router.push("/posts");
        })
        .catch((error) => console.log(error.response));
    },
  },
};
</script>
