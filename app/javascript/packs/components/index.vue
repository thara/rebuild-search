<template>
  <div class="row">
    <form class="col s12" v-on:submit.prevent="onSubmit">
      <div class="input-field col s2">
        <input v-model="query_cast" id="cast_name" type="text" class="validate">
        <label for="cast_name">Cast</label>
      </div>
      <div class="input-field col s2">
        <input v-model="query_title" id="title" type="text" class="validate">
        <label for="title">Title</label>
      </div>
      <div class="input-field col s2">
        <input v-model="query_note" id="note" type="text" class="validate">
        <label for="note">Note</label>
      </div>
      <div class="input-field col s3">
        <button v-on:click="searchEpisodes" class="btn waves-effect waves-light" type="submit" name="action">Submit
          <i class="material-icons right">search</i>
        </button>
      </div>
    </form>
    <div class="col s12 m10">
      <ul>
        <li v-for="episode in episodes" v-bind:id="'row_episode_' + episode.episode_no">
          <div class="card darken-1">
            <div class="card-content black-text">
              <span class="card-title">{{ episode.title }}</span>
              <p>{{ episode.subtitle }}</p>
            </div>
            <div class="card-action">
              <a v-for="m in episode.cast" :href="m.url">{{ m.name }}</a>
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
        query_cast: '',
        query_title: '',
        query_note: '',
      }
    },
    mounted: function () {
      this.fetchEpisodes();
    },
    methods: {
      fetchEpisodes: function () {
        axios.get('api/episodes').then((resp) => {
          resp.data.episodes.forEach(e => this.episodes.push(e))
        }, (error) => {
          console.log(error);
        })
      },
      searchEpisodes: function () {
        axios.get('api/episodes', {
          params: {
            cast: this.query_cast,
            title: this.query_title,
            note: this.query_note,
          }
        }).then((resp) => {
          this.episodes = []
          resp.data.episodes.forEach(e => this.episodes.push(e))
        }, (error) => {
          console.log(error);
        })
      },
    }
  }
</script>
