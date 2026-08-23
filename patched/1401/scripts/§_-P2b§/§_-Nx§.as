package §_-P2b§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-33r§.§_-S26§;
   import flash.display.MovieClip;
   import flash.geom.Point;
   import game.mainGame.SquirrelGame;
   import protocol.§_-S2I§;
   
   public class §_-Nx§ extends §_-H2N§
   {
      
      private static const §_-c1F§:Number = 25;
      
      private static var §_-D1P§:MovieClip = null;
      
      private static var §_-V2G§:MovieClip = null;
      
      public function §_-Nx§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "PerkCaesar";
      }
      
      override public function get json() : String
      {
         var _loc2_:Hero = null;
         var _loc3_:b2Vec2 = null;
         if(this.active)
         {
            return "";
         }
         var _loc1_:Array = [];
         for each(_loc2_ in this.hero.game.squirrels.players)
         {
            if(!(_loc2_.isSelf || _loc2_.isDead || _loc2_.inHollow || _loc2_.shaman))
            {
               _loc3_ = this.hero.position.Copy();
               _loc3_.Subtract(_loc2_.position);
               if(_loc3_.Length() <= §_-c1F§)
               {
                  _loc1_.push(_loc2_.id);
               }
            }
         }
         return JSON.stringify(_loc1_);
      }
      
      override public function get totalCooldown() : Number
      {
         return 30;
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
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
               if(param1[2] == §_-S2I§.§_-EY§)
               {
                  _loc2_ = param1[5];
                  _loc3_ = 0;
                  while(_loc3_ < _loc2_.length)
                  {
                     this.hero.game.squirrels.get(_loc2_[_loc3_]).behaviourController.§_-gz§(new §_-S26§(10));
                     _loc3_++;
                  }
                  this.§_-J12§();
               }
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
      
      private function §_-J12§() : void
      {
         if(§_-D1P§ == null)
         {
            §_-D1P§ = new CaesarPerkView();
            §_-D1P§.addFrameScript(§_-D1P§.totalFrames - 1,this.§_-V12§);
         }
         §_-D1P§.mouseEnabled = false;
         §_-D1P§.mouseChildren = false;
         §_-D1P§.width = Game.starling.stage.stageWidth;
         §_-D1P§.height = Game.starling.stage.stageHeight;
         §_-D1P§.gotoAndPlay(0);
         if(!SquirrelGame.instance.contains(§_-D1P§))
         {
            SquirrelGame.instance.addChild(§_-D1P§);
         }
         var _loc1_:Point = this.hero.getPosition();
         if(§_-V2G§ == null)
         {
            §_-V2G§ = new CaesarPerkLightning();
            §_-V2G§.addFrameScript(§_-V2G§.totalFrames - 1,this.§_-3j§);
         }
         §_-V2G§.x = _loc1_.x;
         §_-V2G§.y = _loc1_.y;
         §_-V2G§.rotation = this.hero.rotation;
         §_-V2G§.gotoAndPlay(0);
         if(!this.hero.game.map.§_-X1H§.contains(§_-V2G§))
         {
            this.hero.game.map.§_-X1H§.addChild(§_-V2G§);
         }
      }
      
      private function §_-V12§() : void
      {
         §_-D1P§.stop();
         if(§_-D1P§ != null && Boolean(§_-D1P§.parent))
         {
            §_-D1P§.parent.removeChild(§_-D1P§);
         }
      }
      
      private function §_-3j§() : void
      {
         §_-V2G§.stop();
         if(§_-V2G§ != null && Boolean(§_-V2G§.parent))
         {
            §_-V2G§.parent.removeChild(§_-V2G§);
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         §_-D1P§ = null;
         §_-V2G§ = null;
      }
   }
}

