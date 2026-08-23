package §_-B1O§
{
   import §_-83V§.§_-Q1J§;
   import §_-Y22§.§_-C2x§;
   import §_-qJ§.§_-w1I§;
   import §_-u2r§.§_-q22§;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import game.mainGame.§_-Tm§;
   import game.mainGame.entity.§_-p19§;
   import starling.display.BlendMode;
   import starling.display.Sprite;
   import starling.display.§_-jH§;
   import starling.textures.RenderTexture;
   import starling.textures.Texture;
   
   public class §_-O1q§ extends Sprite implements §_-Tm§, §_-C2x§
   {
      
      public static const §_-43D§:int = 175;
      
      public static const §_-1t§:int = 225;
      
      public static const §_-c2I§:int = 157;
      
      private static const §_-t2J§:int = 50;
      
      private static const §_-7Q§:Dictionary = new Dictionary();
      
      private static const §_-76§:Texture = Texture.§_-b2K§(new CircleEffectParticle(),false);
      
      private var §_-X1V§:RenderTexture = null;
      
      private var §_-y15§:§_-jH§ = null;
      
      private var §_-O2v§:Dictionary = new Dictionary();
      
      private var hero:Hero = null;
      
      public var §_-x1T§:Point = new Point();
      
      public function §_-O1q§()
      {
         super();
         RenderTexture.§_-o1v§ = true;
         this.touchable = false;
         §_-K1r§.addEventListener(§_-K1r§.§_-n2V§,this.redraw);
         this.§_-B1e§();
      }
      
      public function addObject(param1:*) : void
      {
         this.§_-O2v§[param1] = null;
         if(param1 is Hero && param1.id == Game.selfId)
         {
            this.hero = param1;
         }
      }
      
      public function removeObject(param1:*) : void
      {
         if(!this.§_-O2v§)
         {
            return;
         }
         this.§_-K1b§(param1);
         delete this.§_-O2v§[param1];
      }
      
      public function update(param1:Number = 0) : void
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:§_-jH§ = null;
         var _loc11_:* = undefined;
         if(!this.§_-X1V§)
         {
            this.redraw();
            return;
         }
         this.§_-X1V§.clear(0,1);
         var _loc2_:int = this.§_-x1T§.x + §_-t2J§;
         var _loc3_:int = this.§_-x1T§.y + §_-t2J§;
         for(_loc11_ in this.§_-O2v§)
         {
            if(!this.§_-11J§(_loc11_))
            {
               this.§_-K1b§(_loc11_);
            }
            else
            {
               _loc4_ = §_-7Q§[_loc11_.constructor] || [0,0];
               _loc5_ = _loc11_.x + _loc4_[0];
               _loc6_ = _loc11_.y + _loc4_[1];
               _loc7_ = _loc11_ is §_-p19§ ? int(_loc11_.spotSize) : §_-43D§;
               _loc8_ = _loc2_ + _loc5_ - (_loc7_ >> 1);
               _loc9_ = _loc3_ + _loc6_ - (_loc7_ >> 1);
               if(_loc8_ + _loc7_ <= 0 || _loc8_ >= Game.starling.stage.stageWidth + §_-t2J§ << 1 || _loc9_ + _loc7_ <= 0 || _loc9_ >= Game.starling.stage.stageHeight + §_-t2J§ << 1)
               {
                  this.§_-K1b§(_loc11_);
               }
               else
               {
                  _loc10_ = this.§_-O2v§[_loc11_] = this.§_-O2v§[_loc11_] || this.§_-C3V§(_loc7_);
                  _loc10_.x = _loc8_;
                  _loc10_.y = _loc9_;
                  this.§_-X1V§.draw(_loc10_);
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
         §_-K1r§.removeEventListener(§_-K1r§.§_-n2V§,this.redraw);
         if(this.§_-O2v§)
         {
            for(_loc1_ in this.§_-O2v§)
            {
               this.§_-K1b§(_loc1_);
            }
         }
         this.§_-O2v§ = null;
         if(this.§_-X1V§)
         {
            this.§_-X1V§.dispose();
         }
         if(this.§_-y15§)
         {
            this.§_-y15§.dispose();
         }
         this.§_-X1V§ = null;
         this.§_-y15§ = null;
         this.hero = null;
      }
      
      private function §_-C3V§(param1:int) : §_-jH§
      {
         var _loc2_:§_-jH§ = new §_-jH§(§_-76§);
         _loc2_.width = _loc2_.height = param1;
         _loc2_.blendMode = BlendMode.§_-i2E§;
         return _loc2_;
      }
      
      private function §_-B1e§() : void
      {
         §_-7Q§[§_-Q1J§] = [20,20];
         §_-7Q§[Hero] = [0,-10];
         §_-7Q§[§_-w1I§] = [0,-15];
         §_-7Q§[§_-q22§] = [0,-25];
      }
      
      private function §_-K1b§(param1:*) : void
      {
         var _loc2_:§_-jH§ = this.§_-O2v§[param1];
         if(_loc2_)
         {
            _loc2_.dispose();
            _loc2_ = null;
         }
      }
      
      private function §_-11J§(param1:*) : Boolean
      {
         var _loc2_:Hero = null;
         if(!param1.visible || param1 is DisplayObject && param1.alpha == 0)
         {
            return false;
         }
         if(param1 is Hero)
         {
            _loc2_ = param1;
            if(!_loc2_ || !_loc2_.§_-k2W§ || _loc2_.isDead || _loc2_.inHollow)
            {
               return false;
            }
            if(Boolean(this.hero) && Boolean(!(this.hero.shaman || this.hero.inHollow || this.hero.isDead)) && (this.hero.id != _loc2_.id && !(_loc2_.isScrat && _loc2_.§_-426§) && !_loc2_.shaman))
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
         if(this.§_-X1V§)
         {
            this.§_-X1V§.dispose();
            this.§_-X1V§ = null;
         }
         this.§_-X1V§ = new RenderTexture(Game.starling.stage.stageWidth + 2 * §_-t2J§,Game.starling.stage.stageHeight + 2 * §_-t2J§);
         this.§_-X1V§.root.§_-x2b§ = function():void
         {
            redraw();
         };
         if(contains(this.§_-y15§))
         {
            removeChild(this.§_-y15§);
         }
         this.§_-y15§ = new §_-jH§(this.§_-X1V§);
         this.§_-y15§.x = -§_-t2J§;
         this.§_-y15§.y = -§_-t2J§;
         addChild(this.§_-y15§);
         this.update();
      }
   }
}

