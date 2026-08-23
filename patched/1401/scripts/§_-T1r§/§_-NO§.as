package §_-T1r§
{
   import §_-RI§.§_-h2I§;
   import flash.utils.getDefinitionByName;
   
   public class §_-NO§ extends §_-h2I§
   {
      
      private static const §_-b10§:Array = [GodModeActive0,GodModeActive1,GodModeActive2];
      
      private const views:Vector.<§_-h2I§> = new Vector.<§_-h2I§>(3,true);
      
      private var §_-U2q§:int = -1;
      
      public function §_-NO§()
      {
         super();
         var _loc1_:int = 0;
         while(_loc1_ < this.views.length)
         {
            this.views[_loc1_] = new §_-h2I§(new §_-b10§[_loc1_]());
            this.views[_loc1_].visible = false;
            §_-83v§(this.views[_loc1_]);
            _loc1_++;
         }
      }
      
      public function update(param1:int) : void
      {
         if(this.§_-U2q§ == param1)
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
            §_-n2T§(0);
         }
      }
   }
}

