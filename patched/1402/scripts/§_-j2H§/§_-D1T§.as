package §_-j2H§
{
   import §_-8Q§.§_-t20§;
   import §_-921§.§_-A25§;
   import §_-I1q§.§_-430§;
   import §_-I2Y§.§_-l2r§;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import game.mainGame.§_-F1c§;
   import game.mainGame.entity.§_-p2r§;
   import starling.display.BlendMode;
   import starling.display.Sprite;
   import starling.display.§_-I2q§;
   import starling.textures.RenderTexture;
   import starling.textures.Texture;
   
   public class §_-D1T§ extends Sprite implements §_-F1c§, §_-l2r§
   {
      
      public static const §_-12O§:int = 175;
      
      public static const §_-P25§:int = 225;
      
      public static const §_-b2q§:int = 157;
      
      private static const §_-p1C§:int = 50;
      
      private static const §_-826§:Dictionary = new Dictionary();
      
      private static const §_-t1R§:Texture = Texture.§_-h2H§(new CircleEffectParticle(),false);
      
      private var §_-62W§:RenderTexture = null;
      
      private var §_-P1Z§:§_-I2q§ = null;
      
      private var §_-Y1B§:Dictionary = new Dictionary();
      
      private var hero:Hero = null;
      
      public var §_-H15§:Point = new Point();
      
      public function §_-D1T§()
      {
         super();
         RenderTexture.§_-JK§ = true;
         this.touchable = false;
         §_-73Q§.addEventListener(§_-73Q§.§_-J1D§,this.redraw);
         this.§_-u1Z§();
      }
      
      public function addObject(param1:*) : void
      {
         this.§_-Y1B§[param1] = null;
         if(param1 is Hero && param1.id == Game.selfId)
         {
            this.hero = param1;
         }
      }
      
      public function removeObject(param1:*) : void
      {
         if(!this.§_-Y1B§)
         {
            return;
         }
         this.§_-S1I§(param1);
         delete this.§_-Y1B§[param1];
      }
      
      public function update(param1:Number = 0) : void
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:§_-I2q§ = null;
         var _loc11_:* = undefined;
         if(!this.§_-62W§)
         {
            this.redraw();
            return;
         }
         this.§_-62W§.clear(0,1);
         var _loc2_:int = this.§_-H15§.x + §_-p1C§;
         var _loc3_:int = this.§_-H15§.y + §_-p1C§;
         for(_loc11_ in this.§_-Y1B§)
         {
            if(!this.§_-7I§(_loc11_))
            {
               this.§_-S1I§(_loc11_);
            }
            else
            {
               _loc4_ = §_-826§[_loc11_.constructor] || [0,0];
               _loc5_ = _loc11_.x + _loc4_[0];
               _loc6_ = _loc11_.y + _loc4_[1];
               _loc7_ = _loc11_ is §_-p2r§ ? int(_loc11_.spotSize) : §_-12O§;
               _loc8_ = _loc2_ + _loc5_ - (_loc7_ >> 1);
               _loc9_ = _loc3_ + _loc6_ - (_loc7_ >> 1);
               if(_loc8_ + _loc7_ <= 0 || _loc8_ >= Game.starling.stage.stageWidth + §_-p1C§ << 1 || _loc9_ + _loc7_ <= 0 || _loc9_ >= Game.starling.stage.stageHeight + §_-p1C§ << 1)
               {
                  this.§_-S1I§(_loc11_);
               }
               else
               {
                  _loc10_ = this.§_-Y1B§[_loc11_] = this.§_-Y1B§[_loc11_] || this.§_-13c§(_loc7_);
                  _loc10_.x = _loc8_;
                  _loc10_.y = _loc9_;
                  this.§_-62W§.draw(_loc10_);
               }
            }
         }
      }
      
      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
         if(param1)
         {
            this.redraw();
         }
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = undefined;
         §_-73Q§.removeEventListener(§_-73Q§.§_-J1D§,this.redraw);
         if(this.§_-Y1B§)
         {
            for(_loc1_ in this.§_-Y1B§)
            {
               this.§_-S1I§(_loc1_);
            }
         }
         this.§_-Y1B§ = null;
         if(this.§_-62W§)
         {
            this.§_-62W§.dispose();
         }
         if(this.§_-P1Z§)
         {
            this.§_-P1Z§.dispose();
         }
         this.§_-62W§ = null;
         this.§_-P1Z§ = null;
         this.hero = null;
      }
      
      private function §_-13c§(param1:int) : §_-I2q§
      {
         var _loc2_:§_-I2q§ = new §_-I2q§(§_-t1R§);
         _loc2_.width = _loc2_.height = param1;
         _loc2_.blendMode = BlendMode.§_-h2g§;
         return _loc2_;
      }
      
      private function §_-u1Z§() : void
      {
         §_-826§[§_-t20§] = [20,20];
         §_-826§[Hero] = [0,-10];
         §_-826§[§_-A25§] = [0,-15];
         §_-826§[§_-430§] = [0,-25];
      }
      
      private function §_-S1I§(param1:*) : void
      {
         var _loc2_:§_-I2q§ = this.§_-Y1B§[param1];
         if(_loc2_)
         {
            _loc2_.dispose();
            _loc2_ = null;
         }
      }
      
      private function §_-7I§(param1:*) : Boolean
      {
         var _loc2_:Hero = null;
         if(!param1.visible || param1 is DisplayObject && param1.alpha == 0)
         {
            return false;
         }
         if(param1 is Hero)
         {
            _loc2_ = param1;
            if(!_loc2_ || !_loc2_.§_-K13§ || _loc2_.isDead || _loc2_.inHollow)
            {
               return false;
            }
            if(Boolean(this.hero) && Boolean(!(this.hero.shaman || this.hero.inHollow || this.hero.isDead)) && (this.hero.id != _loc2_.id && !(_loc2_.isScrat && _loc2_.§_-62F§) && !_loc2_.shaman))
            {
               return false;
            }
         }
         return true;
      }
      
      private function redraw(param1:Event = null) : void
      {
         var e:Event = param1;
         if(!this.visible)
         {
            return;
         }
         if(this.§_-62W§)
         {
            this.§_-62W§.dispose();
            this.§_-62W§ = null;
         }
         this.§_-62W§ = new RenderTexture(Game.starling.stage.stageWidth + 2 * §_-p1C§,Game.starling.stage.stageHeight + 2 * §_-p1C§);
         this.§_-62W§.root.§_-y1f§ = function():void
         {
            redraw();
         };
         if(contains(this.§_-P1Z§))
         {
            removeChild(this.§_-P1Z§);
         }
         this.§_-P1Z§ = new §_-I2q§(this.§_-62W§);
         this.§_-P1Z§.x = -§_-p1C§;
         this.§_-P1Z§.y = -§_-p1C§;
         addChild(this.§_-P1Z§);
         this.update();
      }
   }
}

