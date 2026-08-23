package tape
{
   import §_-I10§.§_-I2h§;
   import §_-I10§.§_-f22§;
   import events.GameEvent;
   
   public class §_-d2§ extends §_-xc§
   {
      
      public function §_-d2§()
      {
         var _loc1_:§_-6a§ = null;
         super();
         this.setData([]);
         for each(_loc1_ in this.objects)
         {
            _loc1_.selected = Game.self["interior"].indexOf(_loc1_.id) != -1;
            _loc1_.§_-c1X§ = §_-f22§.§_-q27§(_loc1_.id);
         }
         §_-f22§.addEventListener(GameEvent.INTERIOR_CHANGE,this.§_-oZ§);
      }
      
      private static function §_-73d§(param1:§_-6a§, param2:§_-6a§) : int
      {
         if(param1.§_-c1X§ != param2.§_-c1X§)
         {
            return param2.§_-c1X§ ? 1 : -1;
         }
         return param1.id < param2.id ? 1 : -1;
      }
      
      override public function setData(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < §_-I2h§.DATA.length)
         {
            addObject(new §_-6a§(_loc2_));
            _loc2_++;
         }
         this.sort();
      }
      
      override protected function sort() : void
      {
         this.objects.sort(§_-73d§);
      }
      
      private function §_-oZ§(param1:GameEvent = null) : void
      {
         var _loc2_:§_-6a§ = null;
         for each(_loc2_ in this.objects)
         {
            _loc2_.selected = Game.self["interior"].indexOf(_loc2_.id) != -1;
            _loc2_.§_-c1X§ = §_-f22§.§_-q27§(_loc2_.id);
         }
         this.sort();
      }
   }
}

