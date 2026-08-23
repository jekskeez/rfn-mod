package tape
{
   import §_-X1k§.§_-I2l§;
   import §_-X1k§.§_-m2r§;
   import events.GameEvent;
   
   public class §_-L2a§ extends §_-h2f§
   {
      
      public function §_-L2a§()
      {
         var _loc1_:§_-u6§ = null;
         super();
         this.setData([]);
         for each(_loc1_ in this.objects)
         {
            _loc1_.selected = Game.self["interior"].indexOf(_loc1_.id) != -1;
            _loc1_.§_-j2X§ = §_-I2l§.§_-b1x§(_loc1_.id);
         }
         §_-I2l§.addEventListener(GameEvent.INTERIOR_CHANGE,this.§_-U1J§);
      }
      
      private static function §_-F2G§(param1:§_-u6§, param2:§_-u6§) : int
      {
         if(param1.§_-j2X§ != param2.§_-j2X§)
         {
            return param2.§_-j2X§ ? 1 : -1;
         }
         return param1.id < param2.id ? 1 : -1;
      }
      
      override public function setData(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < §_-m2r§.DATA.length)
         {
            addObject(new §_-u6§(_loc2_));
            _loc2_++;
         }
         this.sort();
      }
      
      override protected function sort() : void
      {
         this.objects.sort(§_-F2G§);
      }
      
      private function §_-U1J§(param1:GameEvent = null) : void
      {
         var _loc2_:§_-u6§ = null;
         for each(_loc2_ in this.objects)
         {
            _loc2_.selected = Game.self["interior"].indexOf(_loc2_.id) != -1;
            _loc2_.§_-j2X§ = §_-I2l§.§_-b1x§(_loc2_.id);
         }
         this.sort();
      }
   }
}

