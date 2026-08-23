package views
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.utils.getDefinitionByName;
   import game.mainGame.§_-Tm§;
   
   public class §_-W15§ extends Sprite implements §_-Tm§
   {
      
      public static const §_-Y15§:Number = 10;
      
      private static const §_-u1r§:Array = [RebornNumber0,RebornNumber1,RebornNumber2,RebornNumber3,RebornNumber4,RebornNumber5,RebornNumber6,RebornNumber7,RebornNumber8,RebornNumber9];
      
      public var onComplete:Function = null;
      
      private var §_-d1I§:DisplayObject = null;
      
      private var §_-y2Y§:Array = [];
      
      private var §_-un§:Number = 0;
      
      public function §_-W15§()
      {
         super();
         var _loc1_:int = 0;
         while(_loc1_ < §_-u1r§.length)
         {
            this.§_-y2Y§.push(new §_-u1r§[_loc1_]());
            _loc1_++;
         }
      }
      
      public function get active() : Boolean
      {
         return this.§_-un§ > 0;
      }
      
      public function start(param1:Number = 10) : void
      {
         this.§_-un§ = param1;
         this.§_-l13§();
      }
      
      public function stop() : void
      {
         this.§_-un§ = 0;
         this.hide();
      }
      
      public function update(param1:Number = 0) : void
      {
         if(this.§_-un§ <= 0)
         {
            return;
         }
         this.§_-un§ -= param1;
         if(this.§_-un§ <= 0)
         {
            this.stop();
            if(this.onComplete != null)
            {
               this.onComplete();
            }
            return;
         }
         this.§_-l13§();
      }
      
      public function hide() : void
      {
         if(this.§_-d1I§ == null || !contains(this.§_-d1I§))
         {
            return;
         }
         removeChild(this.§_-d1I§);
         this.§_-d1I§ = null;
      }
      
      public function §_-cO§(param1:int) : void
      {
         this.hide();
         if(param1 <= 0 || param1 >= this.§_-y2Y§.length)
         {
            return;
         }
         this.§_-d1I§ = this.§_-y2Y§[param1];
         addChild(this.§_-d1I§);
      }
      
      public function §_-l13§() : void
      {
         this.§_-cO§(Math.min(9,Math.max(1,Math.ceil(this.§_-un§))));
         this.x = (Game.starling.stage.stageWidth - this.width) * 0.5;
         this.y = (Game.starling.stage.stageHeight - this.height) * 0.5;
      }
   }
}

