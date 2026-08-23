package §_-j2E§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-8Q§.GameBody;
   import §_-TK§.§_-aS§;
   import §_-c2C§.§_-817§;
   import §_-f1T§.TouchEvent;
   import §_-f1T§.§_-01Z§;
   import §_-f1T§.§_-J1a§;
   import flash.events.KeyboardEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   import flash.ui.Mouse;
   import flash.utils.setTimeout;
   import game.mainGame.entity.§_-p0§;
   import game.mainGame.entity.§_-sn§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import starling.core.Starling;
   
   public class §_-52h§ extends §_-92f§
   {
      
      protected var §_-5W§:§_-aS§ = null;
      
      protected var §_-WP§:Point = new Point();
      
      protected var §_-z2x§:Point = new Point();
      
      protected var §_-5b§:Point = new Point();
      
      protected var §_-72x§:Boolean = false;
      
      public function §_-52h§(param1:Hero)
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
         return JSON.stringify([this.§_-WP§,new Point(_loc1_.x,_loc1_.y),_loc2_]);
      }
      
      override public function dispose() : void
      {
         this.§_-c2j§();
         super.dispose();
      }
      
      override public function §_-xm§() : void
      {
         this.§_-c2j§();
         super.§_-xm§();
      }
      
      override public function §_-V1z§() : void
      {
         if(!this.hero || !this.hero.game)
         {
            return;
         }
         this.§_-WP§ = new Point();
         setTimeout(this.setSelection,100);
      }
      
      override public function set active(param1:Boolean) : void
      {
         if(!param1)
         {
            this.§_-c2j§();
         }
         super.active = param1;
      }
      
      override protected function deactivate() : void
      {
         this.§_-c2j§();
         super.deactivate();
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
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
            case §_-s2l§.§_-C1i§:
               if(param1[2] == §_-s2l§.§_-j2o§)
               {
                  return;
               }
               if(param1[1] != this.§_-T2a§ || param1[0] != this.hero.id)
               {
                  return;
               }
               this.active = param1[2] == §_-s2l§.§_-x2Y§;
               if(param1[2] != §_-s2l§.§_-x2Y§)
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
               _loc7_ = new Point(param1[5][0].x * Game.§_-12A§,param1[5][0].y * Game.§_-12A§);
               _loc5_.angle = _loc4_;
               _loc5_.position = _loc3_.Copy();
               _loc5_.playerId = this.hero.id;
               (_loc5_ as §_-p0§).velocity = 100 * (Math.min(_loc6_.subtract(_loc7_).length,this.maxLength) / this.maxLength);
               _loc5_.linearVelocity = new b2Vec2(Math.cos(_loc4_) * (_loc5_ as §_-sn§).maxVelocity,Math.sin(_loc4_) * (_loc5_ as §_-sn§).maxVelocity);
               this.hero.game.map.add(_loc5_);
               _loc5_.build(this.hero.game.world);
               break;
            default:
               super.§_-x2f§(param1);
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
         if(this.§_-5W§)
         {
            this.§_-5W§.removeFromParent();
         }
         this.§_-5W§ = new §_-aS§(new PoiseArrow());
         this.§_-5W§.visible = false;
         this.§_-5W§.§_-i18§("left","center");
         §_-817§.§_-X2a§.addChild(this.§_-5W§.getStarlingView());
         this.§_-72x§ = true;
         §_-817§.instance.addEventListener(TouchEvent.§_-qu§,this.§_-w1m§);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-r1i§);
      }
      
      protected function §_-c2j§() : void
      {
         if(!this.hero || !this.hero.isSelf)
         {
            return;
         }
         if(this.§_-5W§)
         {
            this.§_-5W§.removeFromParent();
         }
         this.§_-72x§ = false;
         Mouse.show();
         §_-817§.instance.removeEventListener(TouchEvent.§_-qu§,this.§_-w1m§);
         Game.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-r1i§);
      }
      
      protected function §_-r1i§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.ESCAPE)
         {
            return;
         }
         this.§_-c2j§();
      }
      
      protected function §_-w1m§(param1:TouchEvent) : void
      {
         var _loc2_:§_-J1a§ = param1.§_-d2S§(Starling.§_-n1s§.stage);
         if(!_loc2_)
         {
            return;
         }
         this.§_-z2x§.setTo(_loc2_.§_-ca§,_loc2_.§_-n2z§);
         this.§_-5b§ = _loc2_.§_-13l§(§_-817§.instance);
         var _loc3_:Boolean = Boolean(this.hero.game) && this.hero.game.§_-M6§();
         var _loc4_:Point = this.hero.heroView.localToGlobal(new Point(0,-23));
         var _loc5_:Number = Math.atan2(this.§_-5b§.y - _loc4_.y,this.§_-5b§.x - _loc4_.x);
         var _loc6_:int = this.§_-5b§.subtract(_loc4_).length;
         this.§_-5W§.x = _loc4_.x;
         this.§_-5W§.y = _loc4_.y;
         this.§_-5W§.rotation = 0;
         this.§_-5W§.scaleX = 1;
         this.§_-5W§.scaleX = Math.min(_loc6_,this.maxLength) / this.§_-5W§.width;
         this.§_-5W§.rotation = _loc5_ * Game.R2D;
         this.§_-5W§.visible = _loc3_;
         if(_loc3_)
         {
            Mouse.hide();
         }
         else
         {
            Mouse.show();
         }
         if(_loc2_.§_-iR§ == §_-01Z§.§_-1Z§ && this.§_-72x§ && _loc3_)
         {
            this.§_-w2U§();
         }
      }
      
      protected function §_-w2U§() : void
      {
         var _loc1_:Point = this.hero.game.squirrels.globalToLocal(this.§_-z2x§);
         this.§_-WP§ = new Point(_loc1_.x / Game.§_-12A§,_loc1_.y / Game.§_-12A§);
         this.§_-WP§.subtract(new Point(this.hero.game.map.x,this.hero.game.map.y));
         Connection.§_-e2T§(§_-u1O§.§_-C1i§,this.§_-T2a§,!this.active,this.target,this.json);
         this.§_-c2j§();
         this.§_-72x§ = false;
      }
   }
}

