using FrontEnd.Models;

namespace FrontEnd.Servicio
{
    public class MesaService
    {
        private readonly HttpClient _httpClient;
        private readonly IConfiguration _configuration;
        string _baseURL = string.Empty;

        public MesaService(HttpClient httpClient, IConfiguration configuration)
        {
            _httpClient = httpClient;
            _configuration = configuration;
            _baseURL = _configuration["UrlBaseAPIs"];
            _httpClient.BaseAddress = new Uri(_baseURL);
        }

        public async Task<IEnumerable<Mesa>> GetMesasAsync(string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.GetAsync("Mesa/ObtenerMesaTodos");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<IEnumerable<Mesa>>();
        }

        public async Task<bool> CreateMesaAsync(Mesa mesa, string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.PostAsJsonAsync("Mesa/InsertarMesa", mesa);
            return response.IsSuccessStatusCode;
        }

        public async Task<bool> UpdateMesaAsync(Mesa mesa, string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.PutAsJsonAsync("Mesa/ActualizarMesa", mesa);
            return response.IsSuccessStatusCode;
        }

        public async Task<bool> DeleteMesaAsync(int id, string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.DeleteAsync($"Mesa/EliminarMesa/{id}");
            return response.IsSuccessStatusCode;
        }
    }
}
