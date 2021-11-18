<template>
  <div class="posts">
    <h1>This is a posts page</h1>
    <div>
      <h5>Search Posts:</h5>
      <input type="text" v-model="titleFilter" list="titles" />
      <datalist id="titles">
        <option v-for="post in posts" :key="post.id">{{ post.title }}</option>
      </datalist>
    </div>
    <!-- <div>
      <span @mouseover="hover = true" @mouseleave="hover = false">
        <p>Hover me to show the message!</p>
      </span>
      <span v-if="hover">
        <p>This is a secret message.</p>
      </span>
    </div> -->
    <div class="container">
      <div
        v-on:click="currentPost = post"
        v-bind:class="{ hovered: post === currentPost }"
        v-for="post in filterBy(posts, titleFilter, 'title', 'body')"
        :key="post.id"
      >
        <div class="card" style="width: 18rem">
          <div class="card-body">
            <span @mouseover="hover = true" @mouseleave="hover = false">
              <h5 class="card-title">{{ post.title }}</h5>
              <img :src="post.image" class="card-img-top" alt="..." />
            </span>
            <span v-if="hover">
              <p class="card-text">{{ post.body }}</p>
              <p class="card-text">Added: {{ relativeDate(post.created_at) }}</p>
            </span>

            <p class="card-text">Updated: {{ relativeDate(post.updated_at) }}</p>
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
.hovered {
  background-color: lightskyblue;
  transition: background-color 1s ease;
}
.card {
  margin: 0 auto;
  float: none;
  margin-bottom: 10px;
  background-color: lightskyblue;
  color: black;
}
</style>

<script>
// @ is an alias to /src
import axios from "axios";
import moment from "moment";
import Vue2Filters from "vue2-filters";

export default {
  mixins: [Vue2Filters.mixin],
  data: function () {
    return {
      message: "Welcome to Ian's Blog!",
      posts: [],
      currentPost: {},
      hover: false,
      titleFilter: "",
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
    relativeDate: function (date) {
      return moment(date).fromNow();
    },
    // createPost: function () {},
  },
};
</script>
