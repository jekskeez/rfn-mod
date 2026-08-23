package §_-u1R§
{
   import §_-X1k§.§_-f4§;
   import §_-c2C§.§_-817§;
   import buttons.§_-K2G§;
   import buttons.§_-j2x§;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.setTimeout;
   import sounds.GameSounds;
   
   public class §_-s1f§ extends Sprite
   {
      
      private static var §_-T1a§:Vector.<§_-s1f§> = new Vector.<§_-s1f§>(0);
      
      private var reward:Object = null;
      
      private var §_-gl§:MovieClip = null;
      
      private var index:int = -1;
      
      private var §_-E2N§:Boolean = false;
      
      private var §_-O1b§:§_-K2G§ = null;
      
      private var §_-BL§:§_-K2G§ = null;
      
      public function §_-s1f§(param1:Object, param2:Class = null)
      {
         var reward:Object = param1;
         var issuanceView:Class = param2;
         super();
         §_-817§.§_-l2x§();
         this.reward = reward;
         this.§_-E2N§ = this.§_-U9§();
         this.graphics.beginFill(0,0.8);
         this.graphics.drawRect(0,0,Game.starling.stage.stageWidth,Game.starling.stage.stageHeight);
         GameSounds.§_-411§("bundle_wait",7.214 * 1000);
         this.§_-gl§ = new issuanceView() || new MovieBonus();
         this.§_-gl§.addEventListener(MouseEvent.CLICK,this.§_-Wn§);
         this.§_-gl§.buttonMode = true;
         addChild(this.§_-gl§);
         this.§_-gl§.x = int((this.width - this.§_-gl§.width) * 0.5);
         this.§_-gl§.y = int((this.height - this.§_-gl§.height) * 0.5);
         this.§_-gl§.addFrameScript(14,function():void
         {
            §_-gl§.gotoAndPlay(1);
         });
         this.§_-gl§.gotoAndPlay(0);
         this.§_-O1b§ = new §_-j2x§(gls("Открыть"),0,28,null,2);
         this.§_-O1b§.x = int((this.width - this.§_-O1b§.width) * 0.5);
         this.§_-O1b§.y = this.§_-gl§.y + this.§_-gl§.height + 20;
         this.§_-O1b§.addEventListener(MouseEvent.CLICK,this.§_-Wn§);
         addChild(this.§_-O1b§);
         this.§_-BL§ = new §_-j2x§(gls("Забрать всё"),0,28,null,2);
         this.§_-BL§.x = int((this.width - this.§_-BL§.width) * 0.5);
         this.§_-BL§.y = int((this.height - this.§_-BL§.height) * 0.5);
         this.§_-BL§.visible = false;
         this.§_-BL§.addEventListener(MouseEvent.CLICK,this.§_-Q1R§);
         addChild(this.§_-BL§);
         if(§_-T1a§.length == 0)
         {
            this.§_-B1f§();
         }
         §_-T1a§.push(this);
      }
      
      private function §_-Wn§(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         this.§_-O1b§.visible = false;
         this.§_-gl§.removeEventListener(MouseEvent.CLICK,this.§_-Wn§);
         GameSounds.§_-8B§("bundle_wait");
         GameSounds.play("bundle_open");
         this.§_-gl§.addFrameScript(35,this.§_-eM§);
         this.§_-gl§.addFrameScript(this.§_-gl§.totalFrames - 1,function():void
         {
            §_-gl§.stop();
            §_-gl§.visible = false;
         });
         this.§_-gl§.gotoAndPlay(16);
      }
      
      private function §_-tO§() : void
      {
         this.§_-BL§.visible = true;
      }
      
      private function §_-eM§() : void
      {
         var _loc2_:Object = null;
         var _loc1_:int = -1;
         for each(_loc2_ in this.reward.contentItems)
         {
            if(!this.§_-E2N§ || _loc2_.type != _loc1_)
            {
               ++this.index;
            }
            new §_-2r§(_loc2_.type,this.index,int(_loc2_.id) || 0,int(_loc2_.count) || 1).show(this);
            _loc1_ = int(_loc2_.type);
         }
         setTimeout(this.§_-tO§,this.index * 300);
      }
      
      private function §_-Q1R§(param1:MouseEvent) : void
      {
         §_-2r§.hide();
         §_-f4§.§_-6M§(this.reward.id);
      }
      
      private function §_-B1f§() : void
      {
         Game.§_-q1L§.addChild(this);
         §_-2r§.§_-ac§(this.hide);
      }
      
      private function hide() : void
      {
         Game.§_-q1L§.removeChild(this);
         §_-817§.§_-SF§();
         §_-T1a§.shift();
         if(§_-T1a§.length == 0)
         {
            return;
         }
         §_-T1a§[0].§_-B1f§();
      }
      
      private function §_-U9§() : Boolean
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

