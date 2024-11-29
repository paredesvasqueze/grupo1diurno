using FrontEnd.Models;

namespace FrontEnd.Servicio
{
    public class ReservaService
    {
        private readonly HttpClient _httpClient;
        private readonly IConfiguration _configuration;
        string _baseURL = string.Empty;

        public ReservaService(HttpClient httpClient, IConfiguration configuration)
        {
            _httpClient = httpClient;
            _configuration = configuration;
            _baseURL = _configuration["UrlBaseAPIs"];
            _httpClient.BaseAddress = new Uri(_baseURL);
        }

        public async Task<IEnumerable<Reserva>> GetReservasAsync(string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.GetAsync("Reserva/ObtenerReservaTodos");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<IEnumerable<Reserva>>();
        }

        public async Task<bool> CreateReservaAsync(Reserva reserva, string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.PostAsJsonAsync("Reserva/InsertarReserva", reserva);
            return response.IsSuccessStatusCode;
        }

        public async Task<bool> UpdateReservaAsync(Reserva reserva, string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.PutAsJsonAsync($"Reserva/ActualizarReserva", reserva);
            return response.IsSuccessStatusCode;
        }

        public async Task<bool> DeleteReservaAsync(int id, string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.DeleteAsync($"Reserva/EliminarReserva/{id}");
            return response.IsSuccessStatusCode;
        }
    }
}
