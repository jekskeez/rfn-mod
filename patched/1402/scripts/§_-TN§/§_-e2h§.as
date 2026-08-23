package §_-TN§
{
   import §_-Oc§.§_-WE§;
   import §_-Oc§.§_-u16§;
   import §_-n1h§.Perk;
   import §_-n1h§.§_-Ey§;
   
   public class §_-e2h§ extends §_-Ey§
   {
      
      public function §_-e2h§(param1:int)
      {
         super(param1);
      }
      
      override public function set hero(param1:Hero) : void
      {
         var _loc2_:§_-WE§ = null;
         if(!§_-3M§(param1))
         {
            return;
         }
         for each(_loc2_ in param1.perkController.§_-X1B§)
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
         return "<b>«" + §_-u16§.getName(this.id) + "»</b>\n" + §_-u16§.§_-ya§(this.id);
      }
      
      override public function get iconClass() : Class
      {
         return §_-u16§.§_-92G§(this.id);
      }
   }
}

