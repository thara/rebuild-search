<template>
  <div class="row">
    <form class="col s12">
      <div class="input-field col s2">
        <input id="cast_name" type="text" class="validate">
        <label for="cast_name">Cast</label>
      </div>
      <div class="input-field col s2">
        <input id="title" type="text" class="validate">
        <label for="title">Title</label>
      </div>
      <div class="input-field col s2">
        <input id="note" type="text" class="validate">
        <label for="note">Note</label>
      </div>
      <div class="input-field col s2">
        <button class="btn waves-effect waves-light" type="submit" name="action">Submit
          <i class="material-icons right">search</i>
        </button>
      </div>
    </form>
    <div class="col s12 m6">
      <ul>
        <li v-for="episode in episodes" v-bind:id="'row_episode_' + episode.episode_no">
          <div class="card darken-1">
            <div class="card-content black-text">
              <span class="card-title">{{ episode.title }}</span>
              <p>{{ episode.description }}</p>
            </div>
            <div class="card-action">
              <a href="#">N</a>
              <a href="#">miyagawa</a>
            </div>
          </div>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
  import axios from 'axios';

  export default {
    data: function () {
      return {
        episodes: [],
      }
    },
    mounted: function () {
      this.searchEpisodes();
    },
    methods: {
      searchEpisodes: function () {
        axios.get('api/episodes').then((resp) => {
          resp.data.episodes.forEach(e => this.episodes.push(e))
        })
      },
    }
  }
</script>
