<template>
  <div class="posts">
    <h1>This is a posts page</h1>
    <!-- <div>
      <span @mouseover="hover = true" @mouseleave="hover = false">
        <p>Hover me to show the message!</p>
      </span>
      <span v-if="hover">
        <p>This is a secret message.</p>
      </span>
    </div> -->
    <div class="container">
      <div class="row">
        <div class="col">Column</div>
        <div class="col">Column</div>
        <div class="col">Column</div>
      </div>

      <div
        v-on:hover="currentPost = post"
        v-bind:class="{ hovered: post === currentPost }"
        v-for="post in posts"
        :key="post.id"
      >
        <div class="card" style="width: 18rem">
          <div class="card-body">
            <span @mouseover="hover = true" @mouseleave="hover = false">
              <img :src="post.image" class="card-img-top" alt="..." />
            </span>
            <span v-if="hover">
              <h5 class="card-title">{{ post.title }}</h5>
            </span>
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
.hovered {
  background-color: lightskyblue;
  transition: background-color 1s ease;
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
      hover: false,
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
