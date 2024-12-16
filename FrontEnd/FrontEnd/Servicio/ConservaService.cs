using FrontEnd.Models;

namespace FrontEnd.Servicio
{
    public class ConservaService
    {
        private readonly HttpClient _httpClient;
        private readonly IConfiguration _configuration;
        string _baseURL = string.Empty;

        public ConservaService(HttpClient httpClient, IConfiguration configuration)
        {
            _httpClient = httpClient;
            _configuration = configuration;
            _baseURL = _configuration["UrlBaseAPIs"];
            _httpClient.BaseAddress = new Uri(_baseURL);
        }

        public async Task<IEnumerable<Conserva>> GetConservasAsync(string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.GetAsync("Conserva/ObtenerConservaTodos");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<IEnumerable<Conserva>>();
        }

        public async Task<bool> CreateConservaAsync(Conserva conserva, string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.PostAsJsonAsync("Conserva/InsertarConserva", conserva);
            return response.IsSuccessStatusCode;
        }

        public async Task<bool> UpdateConservaAsync(Conserva conserva, string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.PutAsJsonAsync("Conserva/ActualizarConserva", conserva);
            return response.IsSuccessStatusCode;
        }

        public async Task<bool> DeleteConservaAsync(int id, string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.DeleteAsync($"Conserva/EliminarConserva/{id}");
            return response.IsSuccessStatusCode;
        }
    }
}
