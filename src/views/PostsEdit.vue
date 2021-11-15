<template>
  <div class="posts-new">
    <form v-on:submit.prevent="updatePost()">
      <h1>Create New Post!</h1>
      <ul>
        <li v-for="error in errors" v-bind:key="error">{{ error }}</li>
      </ul>
      <div>
        <label>Title:</label>
        <input type="text" v-model="currentPostParams.title" />
      </div>
      <div>
        <label>Content:</label>
        <!-- <input type="text" v-model="currentPostParams.body" /> -->
        <textarea cols="100" rows="5" v-model="currentPostParams.body"></textarea>
      </div>
      <div>
        <label>Image:</label>
        <input type="text" v-model="currentPostParams.image" />
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
      currentPostParams: {},
      errors: [],
    };
  },
  created: function () {
    axios.get(`http://localhost:3000/posts/${this.$route.params.id}`).then((response) => {
      console.log("My Post: ", response.data);
      this.currentPostParams = response.data;
    });
  },
  methods: {
    updatePost: function () {
      console.log("Updating mah post");
      axios
        .put(`/posts/${this.$route.params.id}`, this.currentPostParams)
        .then((response) => {
          this.currentPostParams = response.data;
          this.$router.push(`/posts/${this.$route.params.id}`);
        })
        .catch((error) => console.log(error.response));
    },
  },
};
</script>
