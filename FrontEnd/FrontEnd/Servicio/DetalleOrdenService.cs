﻿using FrontEnd.Models;

namespace FrontEnd.Servicio
{
    public class DetalleOrdenService //: IDetalleOrdenService
    {
        private readonly HttpClient _httpClient;
        private readonly IConfiguration _configuration;
        string _baseURL = string.Empty;

        public DetalleOrdenService(HttpClient httpClient, IConfiguration configuration)
        {
            _httpClient = httpClient;
            _configuration = configuration;
            _baseURL = _configuration["UrlBaseAPIs"];
            _httpClient.BaseAddress = new Uri(_baseURL);
        }

        public async Task<IEnumerable<DetalleOrden>> GetDetalleOrdenesAsync(string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.GetAsync("DetalleOrden/ObtenerDetalleOrdenTodos");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<IEnumerable<DetalleOrden>>();
        }

        public async Task<bool> CreateDetalleOrdenAsync(DetalleOrden detalleOrden, string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.PostAsJsonAsync("DetalleOrden/InsertarDetalleOrden", detalleOrden);
            return response.IsSuccessStatusCode;
        }

        public async Task<bool> UpdateDetalleOrdenAsync(DetalleOrden detalleOrden, string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.PutAsJsonAsync($"DetalleOrden/ActualizarDetalleOrden", detalleOrden);
            return response.IsSuccessStatusCode;
        }

        public async Task<bool> DeleteDetalleOrdenAsync(int id, string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.DeleteAsync($"DetalleOrden/EliminarDetalleOrden/{id}");
            return response.IsSuccessStatusCode;
        }
    }
}
