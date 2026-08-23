package
{
   import §_-TK§.§_-aS§;
   import §_-TK§.§_-f1u§;
   import §_-Vu§.§_-h25§;
   import §_-Vu§.§_-p4§;
   import §_-s2e§.§_-O1h§;
   import dragonBones.§_-833§;
   import flash.display.BlendMode;
   import flash.events.Event;
   import flash.media.SoundChannel;
   import flash.utils.getDefinitionByName;
   import flash.utils.setTimeout;
   import sounds.GameSounds;
   import utils.§_-y4§;
   
   public class §_-23o§ extends §_-aS§ implements §_-y4§
   {
      
      private static const §_-Xw§:String = "acorn";
      
      private static const §_-k2P§:String = "Head";
      
      public static const §_-g24§:String = "stomp";
      
      public static const §_-13R§:String = "laugh";
      
      public static const §_-R29§:String = "chewing";
      
      public static const §_-u19§:String = "spittle";
      
      public static const §_-V2v§:String = "rockRun";
      
      public static const §_-o16§:String = "rockStand";
      
      public static const §_-Q0§:Number = 0.3;
      
      private static const §_-FI§:Array = ["hare_laugh_long","hare_laugh_loop","hare_laugh_short","hare_laugh1","hare_laugh2","hare_laugh3","hare_laugh4"];
      
      private static const §_-T1J§:Array = ["hare_stomp_short0","hare_stomp_short1","hare_stomp_short2","hare_stomp_short3"];
      
      public var armature:§_-833§ = null;
      
      private var §_-6h§:Boolean = false;
      
      private var §_-h1q§:Boolean = false;
      
      private var §_-F1t§:Boolean = false;
      
      private var §_-Z1M§:Boolean = false;
      
      private var §_-q2N§:Boolean = false;
      
      private var §_-Hl§:Boolean = false;
      
      private var §_-D2k§:int = -2;
      
      private var §_-w24§:SoundChannel = null;
      
      private var §_-F1j§:SoundChannel = null;
      
      private var §_-I2z§:SoundChannel = null;
      
      private var §_-e2F§:§_-f1u§ = null;
      
      private var §_-t1h§:§_-aS§ = new §_-aS§();
      
      public function §_-23o§()
      {
         super();
         this.§_-g2s§();
         this.setState(Hero.§_-72g§);
      }
      
      public function remove() : void
      {
         if(this.§_-e2F§)
         {
            this.§_-e2F§.removeFromParent();
         }
         this.§_-e2F§ = null;
         §_-p4§.§_-m1U§.remove(this.armature);
         this.armature.dispose();
         this.armature = null;
         if(this.§_-U2E§(this.§_-t1h§))
         {
            removeChildStarling(this.§_-t1h§,false);
         }
         this.§_-t1h§ = null;
      }
      
      public function get state() : int
      {
         return this.§_-D2k§;
      }
      
      public function set §_-72n§(param1:Number) : void
      {
         this.armature.animation.timeScale += param1;
      }
      
      public function get §_-72n§() : Number
      {
         return 0;
      }
      
      public function setState(param1:int, param2:int = 0) : void
      {
         if(this.§_-D2k§ == param1 && param1 == Hero.§_-72g§)
         {
            return;
         }
         this.§_-D2k§ = param1;
         if(this.§_-e2F§)
         {
            this.§_-e2F§.stop();
            this.§_-e2F§.visible = false;
         }
         if(this.state == Hero.§_-b1i§)
         {
            this.§_-I1h§();
         }
         else
         {
            this.§_-f1h§();
         }
         if(param1 == Hero.§_-72g§)
         {
            return;
         }
         if(this.§_-b2J§ && this.§_-D2k§ != Hero.§_-mM§)
         {
            this.§_-32e§();
            return;
         }
         switch(this.§_-D2k§)
         {
            case Hero.§_-mM§:
               this.§_-xF§();
               this.§_-e2F§.gotoAndPlay(0);
               this.§_-e2F§.visible = true;
               this.§_-t1h§.visible = false;
               break;
            default:
               this.laugh = false;
               this.§_-t1h§.visible = true;
               this.armature.animation.gotoAndPlay(Hero.§_-p2Z§[this.state]);
         }
      }
      
      public function get §_-b2J§() : Boolean
      {
         return this.§_-6h§;
      }
      
      public function set §_-b2J§(param1:Boolean) : void
      {
         this.§_-6h§ = param1;
         if(this.§_-Hl§)
         {
            this.laugh = false;
         }
         this.setState(this.state);
         if(!param1)
         {
            return;
         }
         GameSounds.playUnrepeatable(Math.random() > 0.5 ? "hare_rock_shape" : "hare_rock",§_-Q0§);
      }
      
      public function get stomp() : Boolean
      {
         return this.§_-h1q§;
      }
      
      public function set stomp(param1:Boolean) : void
      {
         this.§_-h1q§ = param1;
         if(this.§_-Hl§)
         {
            this.laugh = false;
         }
         this.armature.animation.gotoAndPlay(param1 ? §_-g24§ : Hero.§_-z1s§);
         if(param1)
         {
            this.§_-G12§();
         }
         else
         {
            this.§_-e1i§();
         }
      }
      
      public function get §_-Y1A§() : Boolean
      {
         return this.§_-F1t§;
      }
      
      public function set §_-Y1A§(param1:Boolean) : void
      {
         this.§_-F1t§ = param1;
         if(param1)
         {
            this.armature.§_-i2v§(§_-k2P§).childArmature.animation.gotoAndPlay(§_-R29§);
         }
         else
         {
            this.armature.animation.gotoAndPlay(Hero.§_-z1s§);
         }
      }
      
      public function set spit(param1:Boolean) : void
      {
         this.§_-Z1M§ = param1;
         this.armature.animation.gotoAndPlay(param1 ? §_-u19§ : Hero.§_-z1s§);
      }
      
      public function get §_-2I§() : Boolean
      {
         return this.§_-q2N§;
      }
      
      public function set §_-2I§(param1:Boolean) : void
      {
         this.§_-q2N§ = param1;
         this.armature.§_-i2v§(§_-Xw§).§_-M1A§ = param1 ? §_-Xw§ : null;
         if(!param1)
         {
            return;
         }
         this.armature.animation.gotoAndPlay(§_-Xw§,-1,-1,NaN,0,§_-Xw§,§_-h25§.§_-fX§);
         this.armature.§_-j2c§();
         §_-p4§.§_-m1U§.§_-a1Q§(§_-p1V§.delay);
      }
      
      public function set laugh(param1:Boolean) : void
      {
         this.§_-Hl§ = param1;
         this.armature.animation.gotoAndPlay(param1 ? §_-13R§ : Hero.§_-z1s§);
         if(param1)
         {
            this.§_-a5§();
         }
         else
         {
            this.§_-x2A§();
         }
      }
      
      private function §_-32e§() : void
      {
         if(this.state == Hero.§_-b1i§)
         {
            this.armature.animation.gotoAndPlay(§_-V2v§);
         }
         else
         {
            this.armature.animation.gotoAndPlay(§_-o16§);
         }
         this.§_-t1h§.visible = true;
      }
      
      private function §_-G12§(param1:Event = null) : void
      {
         this.§_-e1i§();
         if(!this.parentStarling || !this.parentStarling.visible || !GameSounds.on)
         {
            return;
         }
         this.§_-F1j§ = GameSounds.play(§_-T1J§[int(Math.random() * §_-T1J§.length)]);
         if(this.§_-F1j§ == null)
         {
            setTimeout(this.§_-G12§,100);
            return;
         }
         this.§_-F1j§.addEventListener(Event.SOUND_COMPLETE,this.§_-G12§,false,0,true);
      }
      
      private function §_-e1i§() : void
      {
         if(this.§_-F1j§ == null)
         {
            return;
         }
         GameSounds.stop(this.§_-F1j§);
         this.§_-F1j§.removeEventListener(Event.SOUND_COMPLETE,this.§_-G12§,false);
         this.§_-F1j§ = null;
      }
      
      private function §_-a5§(param1:Event = null) : void
      {
         this.§_-x2A§();
         if(!this.parentStarling || !this.parentStarling.visible || !GameSounds.on)
         {
            return;
         }
         this.§_-I2z§ = GameSounds.playUnrepeatable(§_-FI§[int(Math.random() * §_-FI§.length)]);
         if(this.§_-I2z§ == null)
         {
            setTimeout(this.§_-a5§,1000);
            return;
         }
         this.§_-I2z§.addEventListener(Event.SOUND_COMPLETE,this.§_-a5§,false,0,true);
      }
      
      private function §_-x2A§() : void
      {
         if(this.§_-I2z§ == null)
         {
            return;
         }
         GameSounds.stop(this.§_-I2z§);
         this.§_-I2z§.removeEventListener(Event.SOUND_COMPLETE,this.§_-a5§,false);
         this.§_-I2z§ = null;
      }
      
      private function §_-I1h§(param1:Event = null) : void
      {
         this.§_-f1h§();
         if(!this.parentStarling || !this.parentStarling.visible || !GameSounds.on)
         {
            return;
         }
         if(this.§_-72n§ == 1)
         {
            this.§_-w24§ = GameSounds.play("hare_step");
         }
         else
         {
            this.§_-w24§ = GameSounds.play("hare_run");
         }
         if(this.§_-w24§ == null)
         {
            setTimeout(this.§_-I1h§,1000);
            return;
         }
         this.§_-w24§.addEventListener(Event.SOUND_COMPLETE,this.§_-I1h§,false,0,true);
      }
      
      private function §_-f1h§() : void
      {
         if(this.§_-w24§ == null)
         {
            return;
         }
         GameSounds.stop(this.§_-w24§);
         this.§_-w24§.removeEventListener(Event.SOUND_COMPLETE,this.§_-I1h§,false);
         this.§_-w24§ = null;
      }
      
      private function §_-g2s§() : void
      {
         this.armature = §_-O1h§.§_-y1y§().§_-i2H§(§_-O1h§.§_-71l§);
         §_-p4§.§_-m1U§.add(this.armature);
         this.§_-t1h§.§_-J2J§(this.armature.display);
         §_-J2J§(this.§_-t1h§);
      }
      
      private function §_-xF§() : void
      {
         if(this.§_-e2F§)
         {
            return;
         }
         var _loc1_:Class = getDefinitionByName("HareDead") as Class;
         this.§_-e2F§ = new §_-f1u§(new _loc1_());
         this.§_-e2F§.blendMode = BlendMode.SCREEN;
         this.§_-e2F§.loop = false;
         this.§_-e2F§.stop();
         §_-J2J§(this.§_-e2F§);
      }
   }
}

