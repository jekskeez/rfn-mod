package §_-vz§
{
   import §_-X1g§.§_-M8§;
   import §_-X1g§.§_-s2y§;
   import §_-n1h§.Perk;
   import §_-n1h§.§_-Ey§;
   
   public class §_-ur§ extends §_-Ey§
   {
      
      public function §_-ur§(param1:int)
      {
         super(param1);
      }
      
      override public function set hero(param1:Hero) : void
      {
         var _loc2_:§_-M8§ = null;
         if(!§_-3M§(param1))
         {
            return;
         }
         for each(_loc2_ in param1.perkController.§_-N2R§)
         {
            if(_loc2_.§_-T2a§ == this.id)
            {
               this.§_-P2K§ = _loc2_;
               this.§_-P2K§.§_-B3M§ = false;
               this.§_-P2K§.addEventListener(Perk.§_-E1b§,§_-A2n§);
               §_-A2n§();
               return;
            }
         }
         this.§_-F1Y§ = true;
      }
      
      override public function get description() : String
      {
         return "<b>«" + §_-s2y§.getName(this.id) + "»</b>\n" + §_-s2y§.§_-ya§(this.id);
      }
      
      override public function get iconClass() : Class
      {
         return §_-s2y§.§_-92G§(this.id);
      }
   }
}

