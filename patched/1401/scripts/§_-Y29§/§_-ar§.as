package §_-Y29§
{
   import §_-S2§.Perk;
   import §_-S2§.§_-Z1C§;
   import §_-z2j§.§_-33U§;
   import §_-z2j§.§_-63h§;
   
   public class §_-ar§ extends §_-Z1C§
   {
      
      public function §_-ar§(param1:int)
      {
         super(param1);
      }
      
      override public function set hero(param1:Hero) : void
      {
         var _loc2_:§_-33U§ = null;
         if(!§_-qu§(param1))
         {
            return;
         }
         for each(_loc2_ in param1.perkController.§_-13j§)
         {
            if(_loc2_.§_-i2D§ == this.id)
            {
               this.§_-425§ = _loc2_;
               this.§_-425§.§_-03R§ = false;
               this.§_-425§.addEventListener(Perk.§_-RK§,§_-Dh§);
               §_-Dh§();
               return;
            }
         }
         this.§_-3Q§ = true;
      }
      
      override public function get description() : String
      {
         return "<b>«" + §_-63h§.getName(this.id) + "»</b>\n" + §_-63h§.§_-l7§(this.id);
      }
      
      override public function get iconClass() : Class
      {
         return §_-63h§.§_-D2L§(this.id);
      }
   }
}

