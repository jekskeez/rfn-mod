package §_-cm§
{
   import §_-TK§.§_-aS§;
   import flash.utils.getDefinitionByName;
   
   public class §_-s1m§ extends §_-aS§
   {
      
      private static const §_-W2V§:Array = [GodModeActive0,GodModeActive1,GodModeActive2];
      
      private const views:Vector.<§_-aS§> = new Vector.<§_-aS§>(3,true);
      
      private var §_-Km§:int = -1;
      
      public function §_-s1m§()
      {
         super();
         var _loc1_:int = 0;
         while(_loc1_ < this.views.length)
         {
            this.views[_loc1_] = new §_-aS§(new §_-W2V§[_loc1_]());
            this.views[_loc1_].visible = false;
            §_-J2J§(this.views[_loc1_]);
            _loc1_++;
         }
      }
      
      public function update(param1:int) : void
      {
         if(this.§_-Km§ == param1)
         {
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.views.length)
         {
            this.views[_loc2_].visible = _loc2_ == param1;
            _loc2_++;
         }
      }
      
      public function dispose() : void
      {
         while(this.numChildren > 0)
         {
            §_-av§(0);
         }
      }
   }
}

