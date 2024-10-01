﻿namespace ProjetosWebApi.Domain.Entities
{
    public class Theme
    {
        public int id { get; set; }
        public string? name { get; set; }
        public string? description { get; set; }
        public DateTime created_at { get; set; }
        public DateTime updated_at { get; set; }
    }
}
