package §_-rT§
{
   import §_-C2a§.§_-W10§;
   import §_-C2a§.§_-ml§;
   import §_-S2§.Perk;
   import §_-S2§.§_-Z1C§;
   
   public class §_-zS§ extends §_-Z1C§
   {
      
      public function §_-zS§(param1:int)
      {
         super(param1);
      }
      
      override public function set hero(param1:Hero) : void
      {
         var _loc2_:§_-W10§ = null;
         if(!§_-qu§(param1))
         {
            return;
         }
         for each(_loc2_ in param1.perkController.§_-H2X§)
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
         return "<b>«" + §_-ml§.getName(this.id) + "»</b>\n" + §_-ml§.§_-l7§(this.id);
      }
      
      override public function get iconClass() : Class
      {
         return §_-ml§.§_-D2L§(this.id);
      }
   }
}

