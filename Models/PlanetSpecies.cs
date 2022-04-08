namespace daPlanets.Models
{
  public class PlanetSpecies
  {
    public int Id { get; set; }
    public int PlanetId { get; set; }
    public int SpeciesId { get; set; }

  }

  // NOTE a viewmodel is a client only data model - Does not exist in the DB
  public class PlanetSpeciesViewModel : Species
  {
    public int PlanetSpeciesId { get; set; }
  }
}