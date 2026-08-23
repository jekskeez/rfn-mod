package views
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.utils.getDefinitionByName;
   import game.mainGame.§_-F1c§;
   
   public class §_-Y2g§ extends Sprite implements §_-F1c§
   {
      
      public static const §_-31A§:Number = 10;
      
      private static const §_-s1e§:Array = [RebornNumber0,RebornNumber1,RebornNumber2,RebornNumber3,RebornNumber4,RebornNumber5,RebornNumber6,RebornNumber7,RebornNumber8,RebornNumber9];
      
      public var onComplete:Function = null;
      
      private var §_-U1x§:DisplayObject = null;
      
      private var §_-U5§:Array = [];
      
      private var §_-lQ§:Number = 0;
      
      public function §_-Y2g§()
      {
         super();
         var _loc1_:int = 0;
         while(_loc1_ < §_-s1e§.length)
         {
            this.§_-U5§.push(new §_-s1e§[_loc1_]());
            _loc1_++;
         }
      }
      
      public function get active() : Boolean
      {
         return this.§_-lQ§ > 0;
      }
      
      public function start(param1:Number = 10) : void
      {
         this.§_-lQ§ = param1;
         this.§_-ZU§();
      }
      
      public function stop() : void
      {
         this.§_-lQ§ = 0;
         this.hide();
      }
      
      public function update(param1:Number = 0) : void
      {
         if(this.§_-lQ§ <= 0)
         {
            return;
         }
         this.§_-lQ§ -= param1;
         if(this.§_-lQ§ <= 0)
         {
            this.stop();
            if(this.onComplete != null)
            {
               this.onComplete();
            }
            return;
         }
         this.§_-ZU§();
      }
      
      public function hide() : void
      {
         if(this.§_-U1x§ == null || !contains(this.§_-U1x§))
         {
            return;
         }
         removeChild(this.§_-U1x§);
         this.§_-U1x§ = null;
      }
      
      public function §_-l21§(param1:int) : void
      {
         this.hide();
         if(param1 <= 0 || param1 >= this.§_-U5§.length)
         {
            return;
         }
         this.§_-U1x§ = this.§_-U5§[param1];
         addChild(this.§_-U1x§);
      }
      
      public function §_-ZU§() : void
      {
         this.§_-l21§(Math.min(9,Math.max(1,Math.ceil(this.§_-lQ§))));
         this.x = (Game.starling.stage.stageWidth - this.width) * 0.5;
         this.y = (Game.starling.stage.stageHeight - this.height) * 0.5;
      }
   }
}

