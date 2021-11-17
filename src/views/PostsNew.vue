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
        <textarea v-if="newPostParams.body.length < 200" cols="100" rows="5" v-model="newPostParams.body"></textarea>
        <textarea
          v-if="newPostParams.body.length > 200"
          class="red"
          cols="100"
          rows="5"
          v-model="newPostParams.body"
        ></textarea>
        <small v-if="newPostParams.body.length < 200">
          {{ 200 - newPostParams.body.length }} characters remaining.
        </small>
        <small v-if="newPostParams.body.length > 200" class="text-danger">
          {{ 200 - newPostParams.body.length }} characters remaining.
        </small>
      </div>
      <div>
        <label>Image:</label>
        <input type="text" v-model="newPostParams.image" />
      </div>
      <input type="submit" value="Submit" />
    </form>
  </div>
</template>

<style>
.red {
  background-color: rgb(242, 25, 25);
}
</style>
<script>
import axios from "axios";

export default {
  data: function () {
    return {
      newPostParams: { body: "" },
      errors: [],
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
