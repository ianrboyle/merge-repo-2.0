<template>
  <div id="app">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container-fluid">
        <a class="navbar-brand" href="/">Home Page</a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="/about">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/posts">All Posts</a>
            </li>
            <li v-if="isLoggedIn()" class="nav-item">
              <a class="nav-link" href="/posts/new">Create New Post</a>
            </li>
            <li v-if="!isLoggedIn()" class="nav-item">
              <a class="nav-link" href="/signup">Signup</a>
            </li>
            <li v-if="!isLoggedIn()" class="nav-item">
              <a class="nav-link" href="/login">Login</a>
            </li>
            <li v-if="isLoggedIn()" class="nav-item">
              <a class="nav-link" href="/logout">Logout</a>
            </li>
            <!-- <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle"
                href="#"
                id="navbarDropdown"
                role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                Dropdown
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#">Logout</a></li>
                <li><a class="dropdown-item" href="#">Another action</a></li>
                <li><hr class="dropdown-divider" /></li>
                <li><a class="dropdown-item" href="#">Something else here</a></li>
              </ul>
            </li> -->
            <!-- <li class="nav-item">
              <a class="nav-link disabled">Disabled</a>
            </li> -->
          </ul>
          <form class="d-flex">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" />
            <button class="btn btn-outline-success" type="submit">Search</button>
          </form>
        </div>
      </div>
    </nav>
    <div v-if="logInMessage" v-on:click="logInMessage" class="alert alert-success">
      {{ logInMessage }}
    </div>
    <router-view />
  </div>
</template>

<style>
body {
  font-family: "Courier New", Courier, monospace;
  background-image: url("./assets/circle-blues.png");
  color: white;
}
h1 {
  color: lightgreen;
}
p {
  color: black;
}
label {
  color: white;
}
small {
  color: white;
}
</style>

<script>
export default {
  data: function () {
    return {
      logInMessage: "",
    };
  },
  methods: {
    isLoggedIn: function () {
      if (localStorage.getItem("jwt")) {
        return true;
      } else {
        return false;
      }
    },
  },
};
</script>
