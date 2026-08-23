package §_-H7§
{
   import §_-I10§.§_-A29§;
   import §_-T2y§.§_-s1i§;
   import buttons.§_-hH§;
   import buttons.§_-j18§;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.setTimeout;
   import sounds.GameSounds;
   
   public class §_-521§ extends Sprite
   {
      
      private static var §_-RL§:Vector.<§_-521§> = new Vector.<§_-521§>(0);
      
      private var reward:Object = null;
      
      private var §_-KH§:MovieClip = null;
      
      private var index:int = -1;
      
      private var §_-k2Z§:Boolean = false;
      
      private var §_-R1C§:§_-j18§ = null;
      
      private var §_-MB§:§_-j18§ = null;
      
      public function §_-521§(param1:Object, param2:Class = null)
      {
         var reward:Object = param1;
         var issuanceView:Class = param2;
         super();
         §_-s1i§.§_-I0§();
         this.reward = reward;
         this.§_-k2Z§ = this.§_-E1K§();
         this.graphics.beginFill(0,0.8);
         this.graphics.drawRect(0,0,Game.starling.stage.stageWidth,Game.starling.stage.stageHeight);
         GameSounds.§_-A3A§("bundle_wait",7.214 * 1000);
         this.§_-KH§ = new issuanceView() || new MovieBonus();
         this.§_-KH§.addEventListener(MouseEvent.CLICK,this.§_-x1r§);
         this.§_-KH§.buttonMode = true;
         addChild(this.§_-KH§);
         this.§_-KH§.x = int((this.width - this.§_-KH§.width) * 0.5);
         this.§_-KH§.y = int((this.height - this.§_-KH§.height) * 0.5);
         this.§_-KH§.addFrameScript(14,function():void
         {
            §_-KH§.gotoAndPlay(1);
         });
         this.§_-KH§.gotoAndPlay(0);
         this.§_-R1C§ = new §_-hH§(gls("Открыть"),0,28,null,2);
         this.§_-R1C§.x = int((this.width - this.§_-R1C§.width) * 0.5);
         this.§_-R1C§.y = this.§_-KH§.y + this.§_-KH§.height + 20;
         this.§_-R1C§.addEventListener(MouseEvent.CLICK,this.§_-x1r§);
         addChild(this.§_-R1C§);
         this.§_-MB§ = new §_-hH§(gls("Забрать всё"),0,28,null,2);
         this.§_-MB§.x = int((this.width - this.§_-MB§.width) * 0.5);
         this.§_-MB§.y = int((this.height - this.§_-MB§.height) * 0.5);
         this.§_-MB§.visible = false;
         this.§_-MB§.addEventListener(MouseEvent.CLICK,this.§_-q15§);
         addChild(this.§_-MB§);
         if(§_-RL§.length == 0)
         {
            this.§_-a7§();
         }
         §_-RL§.push(this);
      }
      
      private function §_-x1r§(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         this.§_-R1C§.visible = false;
         this.§_-KH§.removeEventListener(MouseEvent.CLICK,this.§_-x1r§);
         GameSounds.§_-x1y§("bundle_wait");
         GameSounds.play("bundle_open");
         this.§_-KH§.addFrameScript(35,this.§_-b2i§);
         this.§_-KH§.addFrameScript(this.§_-KH§.totalFrames - 1,function():void
         {
            §_-KH§.stop();
            §_-KH§.visible = false;
         });
         this.§_-KH§.gotoAndPlay(16);
      }
      
      private function §_-p1W§() : void
      {
         this.§_-MB§.visible = true;
      }
      
      private function §_-b2i§() : void
      {
         var _loc2_:Object = null;
         var _loc1_:int = -1;
         for each(_loc2_ in this.reward.contentItems)
         {
            if(!this.§_-k2Z§ || _loc2_.type != _loc1_)
            {
               ++this.index;
            }
            new §_-b2x§(_loc2_.type,this.index,int(_loc2_.id) || 0,int(_loc2_.count) || 1).show(this);
            _loc1_ = int(_loc2_.type);
         }
         setTimeout(this.§_-p1W§,this.index * 300);
      }
      
      private function §_-q15§(param1:MouseEvent) : void
      {
         §_-b2x§.hide();
         §_-A29§.§_-A3l§(this.reward.id);
      }
      
      private function §_-a7§() : void
      {
         Game.§_-d2t§.addChild(this);
         §_-b2x§.§_-5D§(this.hide);
      }
      
      private function hide() : void
      {
         Game.§_-d2t§.removeChild(this);
         §_-s1i§.§_-EL§();
         §_-RL§.shift();
         if(§_-RL§.length == 0)
         {
            return;
         }
         §_-RL§[0].§_-a7§();
      }
      
      private function §_-E1K§() : Boolean
      {
         var _loc3_:Object = null;
         var _loc1_:int = 0;
         var _loc2_:int = -1;
         for each(_loc3_ in this.reward.contentItems)
         {
            if(_loc3_.type != _loc2_)
            {
               _loc1_++;
               _loc2_ = int(_loc3_.type);
            }
         }
         return _loc1_ > 1;
      }
   }
}

