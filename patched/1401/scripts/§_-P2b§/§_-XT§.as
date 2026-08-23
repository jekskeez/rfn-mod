package §_-P2b§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-83V§.GameBody;
   import §_-K2c§.TouchEvent;
   import §_-K2c§.§_-e2m§;
   import §_-K2c§.§_-sj§;
   import §_-RI§.§_-h2I§;
   import §_-T2y§.§_-s1i§;
   import flash.events.KeyboardEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   import flash.ui.Mouse;
   import flash.utils.setTimeout;
   import game.mainGame.entity.§_-314§;
   import game.mainGame.entity.§_-B2Q§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import starling.core.Starling;
   
   public class §_-XT§ extends §_-H2N§
   {
      
      protected var §_-S1u§:§_-h2I§ = null;
      
      protected var §_-92A§:Point = new Point();
      
      protected var §_-k2C§:Point = new Point();
      
      protected var §_-Us§:Point = new Point();
      
      protected var §_-T1h§:Boolean = false;
      
      public function §_-XT§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get json() : String
      {
         if(this.active)
         {
            return "";
         }
         var _loc1_:Point = this.hero.heroView.localToGlobal(new Point(0,-23));
         var _loc2_:Point = new Point(this.hero.position.x,this.hero.position.y);
         return JSON.stringify([this.§_-92A§,new Point(_loc1_.x,_loc1_.y),_loc2_]);
      }
      
      override public function dispose() : void
      {
         this.§_-os§();
         super.dispose();
      }
      
      override public function §_-S2A§() : void
      {
         this.§_-os§();
         super.§_-S2A§();
      }
      
      override public function §_-7J§() : void
      {
         if(!this.hero || !this.hero.game)
         {
            return;
         }
         this.§_-92A§ = new Point();
         setTimeout(this.setSelection,100);
      }
      
      override public function set active(param1:Boolean) : void
      {
         if(!param1)
         {
            this.§_-os§();
         }
         super.active = param1;
      }
      
      override protected function deactivate() : void
      {
         this.§_-os§();
         super.deactivate();
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:b2Vec2 = null;
         var _loc3_:b2Vec2 = null;
         var _loc4_:Number = NaN;
         var _loc5_:GameBody = null;
         var _loc6_:Point = null;
         var _loc7_:Point = null;
         if(this.hero == null)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-S2I§.§_-w1R§:
               if(param1[2] == §_-S2I§.§_-L2G§)
               {
                  return;
               }
               if(param1[1] != this.§_-i2D§ || param1[0] != this.hero.id)
               {
                  return;
               }
               this.active = param1[2] == §_-S2I§.§_-EY§;
               if(param1[2] != §_-S2I§.§_-EY§)
               {
                  return;
               }
               _loc2_ = new b2Vec2(param1[5][0].x,param1[5][0].y);
               _loc3_ = new b2Vec2(param1[5][2].x,param1[5][2].y);
               _loc4_ = Math.atan2(_loc2_.y - _loc3_.y,_loc2_.x - _loc3_.x);
               _loc5_ = this.castObject;
               if(!_loc5_)
               {
                  return;
               }
               _loc6_ = new Point(param1[5][1].x,param1[5][1].y);
               _loc7_ = new Point(param1[5][0].x * Game.§_-x2P§,param1[5][0].y * Game.§_-x2P§);
               _loc5_.angle = _loc4_;
               _loc5_.position = _loc3_.Copy();
               _loc5_.playerId = this.hero.id;
               (_loc5_ as §_-B2Q§).velocity = 100 * (Math.min(_loc6_.subtract(_loc7_).length,this.maxLength) / this.maxLength);
               _loc5_.linearVelocity = new b2Vec2(Math.cos(_loc4_) * (_loc5_ as §_-314§).maxVelocity,Math.sin(_loc4_) * (_loc5_ as §_-314§).maxVelocity);
               this.hero.game.map.add(_loc5_);
               _loc5_.build(this.hero.game.world);
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
      
      protected function get maxLength() : Number
      {
         return 100;
      }
      
      protected function get castObject() : GameBody
      {
         return null;
      }
      
      protected function setSelection() : void
      {
         if(!this.hero.isSelf || !this.hero.game)
         {
            return;
         }
         Mouse.hide();
         if(this.§_-S1u§)
         {
            this.§_-S1u§.removeFromParent();
         }
         this.§_-S1u§ = new §_-h2I§(new PoiseArrow());
         this.§_-S1u§.visible = false;
         this.§_-S1u§.§_-x2x§("left","center");
         §_-s1i§.§_-831§.addChild(this.§_-S1u§.getStarlingView());
         this.§_-T1h§ = true;
         §_-s1i§.instance.addEventListener(TouchEvent.§_-N1l§,this.§_-K1G§);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-21G§);
      }
      
      protected function §_-os§() : void
      {
         if(!this.hero || !this.hero.isSelf)
         {
            return;
         }
         if(this.§_-S1u§)
         {
            this.§_-S1u§.removeFromParent();
         }
         this.§_-T1h§ = false;
         Mouse.show();
         §_-s1i§.instance.removeEventListener(TouchEvent.§_-N1l§,this.§_-K1G§);
         Game.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-21G§);
      }
      
      protected function §_-21G§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.ESCAPE)
         {
            return;
         }
         this.§_-os§();
      }
      
      protected function §_-K1G§(param1:TouchEvent) : void
      {
         var _loc2_:§_-e2m§ = param1.§_-H2o§(Starling.§_-y1l§.stage);
         if(!_loc2_)
         {
            return;
         }
         this.§_-k2C§.setTo(_loc2_.§_-n2h§,_loc2_.§_-Zv§);
         this.§_-Us§ = _loc2_.§_-l29§(§_-s1i§.instance);
         var _loc3_:Boolean = Boolean(this.hero.game) && this.hero.game.§_-W2H§();
         var _loc4_:Point = this.hero.heroView.localToGlobal(new Point(0,-23));
         var _loc5_:Number = Math.atan2(this.§_-Us§.y - _loc4_.y,this.§_-Us§.x - _loc4_.x);
         var _loc6_:int = this.§_-Us§.subtract(_loc4_).length;
         this.§_-S1u§.x = _loc4_.x;
         this.§_-S1u§.y = _loc4_.y;
         this.§_-S1u§.rotation = 0;
         this.§_-S1u§.scaleX = 1;
         this.§_-S1u§.scaleX = Math.min(_loc6_,this.maxLength) / this.§_-S1u§.width;
         this.§_-S1u§.rotation = _loc5_ * Game.R2D;
         this.§_-S1u§.visible = _loc3_;
         if(_loc3_)
         {
            Mouse.hide();
         }
         else
         {
            Mouse.show();
         }
         if(_loc2_.§_-Q2S§ == §_-sj§.§_-L23§ && this.§_-T1h§ && _loc3_)
         {
            this.§_-D2T§();
         }
      }
      
      protected function §_-D2T§() : void
      {
         var _loc1_:Point = this.hero.game.squirrels.globalToLocal(this.§_-k2C§);
         this.§_-92A§ = new Point(_loc1_.x / Game.§_-x2P§,_loc1_.y / Game.§_-x2P§);
         this.§_-92A§.subtract(new Point(this.hero.game.map.x,this.hero.game.map.y));
         Connection.§_-Li§(§_-h2B§.§_-w1R§,this.§_-i2D§,!this.active,this.target,this.json);
         this.§_-os§();
         this.§_-T1h§ = false;
      }
   }
}

